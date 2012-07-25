from plone.app.layout.viewlets.common import ViewletBase

class AlohaJsViewlet(ViewletBase):
    index = ViewPageTemplateFile('jsviewlet.pt')
