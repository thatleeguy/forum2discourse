class Forum2Discourse::Models::PunBB::Post
  include DataMapper::Resource

  storage_names[:default] = "posts"

  property :id,         Serial
  property :poster,     String
  property :poster_id,  Integer
  property :poster_email, String
  property :message,    Text
  property :posted,     EpochTime
  property :topic_id,   Integer

  belongs_to :topic, 'Forum2Discourse::Models::PunBB::Topic'

  def to_discourse
    Forum2Discourse::Models::Discourse::Post.new({
      title: '',
      category: topic.forum.forum_name,
      raw: message,
      created_at: posted
    })
  end
end
