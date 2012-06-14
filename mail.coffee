class Mail
  constructor: (@folder, mail) ->
    for k, v of mail
      this[k] = v
    this

  @mailData = []
  @setMailData: (@mailData) ->

  @mailsForFolder: (folder) ->
    new Mail(folder, mail) for mail in @mailData

  @oneForFolderAndId: (folder, mailId) ->
    @mailsForFolder(folder)[mailId]


exports = this
exports.Mail = Mail
