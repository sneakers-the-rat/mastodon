# frozen_string_literal: true

class ActivityPub::CidPublicKeySerializer < ActivityPub::Serializer
  context :security

  attributes :id, :type, :owner, :public_key_multibase

  def id
    ActivityPub::TagManager.instance.cid_key_uri_for(object)
  end

  def type
    object.cid_key_type
  end

  def owner
    ActivityPub::TagManager.instance.uri_for(object)
  end

  def public_key_multibase
    object.cid_public_key
  end
end
