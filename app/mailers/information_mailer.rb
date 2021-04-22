class InformationMailer < ApplicationMailer
    def information_mail(plan)
        @plan = plan
        mail to: @plan.takers[0].email, subject: "お申し込み完了のお知らせ"
    end
end
