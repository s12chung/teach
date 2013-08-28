class Ready
  include EasyPresenter::Base
  include ActiveAttr::Model

  attribute :ip

  READY_COLLECTION_KEY = 'ready'

  class << self
    def ip
      request.remote_ip
    end

    def all
      Rails.cache.read(READY_COLLECTION_KEY) || []
    end

    def ready?
      !!find
    end

    def find
      all.find { |ready| ready.ip == ip }
    end

    def add
      unless ready?
        readys = all + [Ready.new(ip: ip)]
        Rails.cache.write(READY_COLLECTION_KEY, readys)
      end
    end

    def delete
      readys = all
      readys.delete(find)
      Rails.cache.write(READY_COLLECTION_KEY, readys)
    end

    def delete_all
      Rails.cache.write(READY_COLLECTION_KEY, [])
    end
  end
end