module Links
  class CleanupService
    def call
      Link.where('created_at < ?', Time.current - 2.weeks).dsetroy_all
    end
  end
end
