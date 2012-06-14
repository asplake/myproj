
Mail = this.Mail


class WebMailApp
  folders: ['Inbox', 'Archive', 'Sent', 'Spam', 'L/F']
  chosenFolderId: ko.observable() 
  chosenFolderData: ko.observable()
  chosenMailData: ko.observable()

  # Display a folder

  goToFolder: (folder) ->
    location.hash = folder

  showFolder: (folder) ->
    console.log "showFolder", folder, "Hello Simon"
    @chosenFolderId folder
    @chosenFolderData mails: Mail.mailsForFolder(folder)
    @chosenMailData null

  # Display an email

  goToMail: (mail) ->
    location.hash = mail.folder + '/' + mail.id

  showMail: (folder, mailId) ->
    @chosenFolderId folder
    @chosenFolderData null
    @chosenMailData Mail.oneForFolderAndId(folder, mailId)


app = new WebMailApp()  
ko.applyBindings(app)

Sammy(->
  @get '#:folder', ->
    app.showFolder(this.params.folder)
  @get '#:folder/:mailId', ->
    app.showMail(this.params.folder, this.params.mailId)
  @get '', ->
    app.goToFolder(app.folders[0])
).run()

