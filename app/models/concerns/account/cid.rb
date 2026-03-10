# frozen_string_literal: true

module Account::Cid
  extend ActiveSupport::Concern

  MULTICODEC_PREFIXES = {
    ed25519: 0xed.to_s(16),
  }.freeze

  included do
    enum :cid_key_type, { ed25519: 0 }, default: :ed25519
    attribute :cid_public_key, :string
    attribute :cid_private_key, :string
    attribute :cid_uri, :string

    def generate_cid_keys
      case cid_key_type
      when 'ed25519'
        ed25519_keypair
      end
    end
  end

  private

  def ed25519_keypair
    signing_key = Ed25519::SigningKey.generate
    self.cid_private_key = Base58.binary_to_base58(signing_key.to_str)
    self.cid_public_key = "z#{Base58.binary_to_base58(MULTICODEC_PREFIXES[:ed25519] + signing_key.verify_key.to_str)}"
  end
end
