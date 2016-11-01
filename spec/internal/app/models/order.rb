class Order < ActiveRecord::Base
  extend WebpayRails

  webpay_rails(
    commerce_code: 597020000541,
    private_key: Rails.root.join('vendor/vault/597020000541.key').to_s,
    public_cert: Rails.root.join('vendor/vault/597020000541.crt').to_s,
    webpay_cert: Rails.root.join('vendor/vault/tbk.pem').to_s
  )

  enum status: [:created, :approved, :failed, :canceled, :expired, :pending,
                :refunded]

  scope :approved, -> { where(status: Order.statuses[:approved]) }
end
