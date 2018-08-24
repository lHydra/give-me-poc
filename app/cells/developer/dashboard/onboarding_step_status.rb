# frozen_string_literal: true

module Developer
  module Dashboard
    # This cell renders status invite to slack or github
    class OnboardingStepStatus < BaseCell
      def onboarding_step_status
        content_tag :div, class: "btn btn-#{color_status} btn-sm disabled" do
          t("dashboard.users.table.#{invite_status}")
        end
      end

      private

      def invite_status
        return 'not_completed' unless model.developer_onboarding
        model.developer_onboarding[@options[:resource]] ? 'completed' : 'not_completed'
      end

      def color_status
        return 'danger' unless model.developer_onboarding
        model.developer_onboarding[@options[:resource]] ? 'success' : 'danger'
      end
    end
  end
end
