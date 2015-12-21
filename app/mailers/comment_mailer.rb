class CommentMailer < ApplicationMailer
	default from: 'totaste.org@gmail.com'
	add_template_helper(ApplicationHelper)

	def comment_notification(comment, article)
		@comment = comment
		@article = article 
		mail(to: 'rymcmahon716@gmail.com', subject: 'Blog Comment Recorded')
	end
end
