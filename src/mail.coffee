class Mail
  constructor: (@folder, mail) ->
    for k, v of mail
      this[k] = v
    if @date
      @date = new Date(@date)
    console.log @date
    this

  @mailData = []
  @setMailData: (@mailData) ->

  @mailsForFolder: (folder) ->
    new Mail(folder, mail) for mail in @mailData

  @oneForFolderAndId: (folder, mailId) ->
    @mailsForFolder(folder)[mailId]


exports = this
exports.Mail = Mail
