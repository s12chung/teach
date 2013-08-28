class Ready
  include EasyPresenter::Base
  include ActiveAttr::Model

  attribute :ip

  READY_COLLECTION_KEY = 'ready'

  class << self
    def all
      Rails.cache.read(READY_COLLECTION_KEY) || []
    end

    def add
      ip = request.remote_ip
      unless all.any? { |ready| ready.ip == ip }
        readys = all + [Ready.new(ip: ip)]
        Rails.cache.write(READY_COLLECTION_KEY, readys)
      end
    end

    def delete_all
      Rails.cache.write(READY_COLLECTION_KEY, [])
    end
  end
end