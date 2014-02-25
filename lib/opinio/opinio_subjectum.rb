module Opinio
  module OpinioSubjectum

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def opinio_subjectum(*args)
        options = args.extract_options!
        options.delete(:as)

        has_many :comments, -> { order(options[:order]) },
          :as => :commentable, :dependent => :destroy, :class_name => Opinio.model_name

      end
    end

  end
end
