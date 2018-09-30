class CommentMailer < ApplicationMailer
	default from: 'ryan@rymcmahon.com'
	add_template_helper(ApplicationHelper)

	def comment_notification(comment, article)
		@comment = comment
		@article = article
		mail(to: 'ryan@ryanmcmahon.org', subject: 'Blog Comment Recorded')
	end
end
