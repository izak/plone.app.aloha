enabline figcaption tag
=======================

For the figure plugin to work properly, you need to tell plone that figcaption
tags are not dangerous. Unfortunatately this view in portal_transforms
is broken, so the simplest way to do this is to drop into debug mode and
execute the following code (replace "plone" in the line starting with
"portal =" with the name of your plone site).

--- snip ---
import transaction
from Testing import makerequest
from AccessControl.SecurityManagement import newSecurityManager
app = makerequest.makerequest(app)
portal = app.plone
user = app.acl_users.getUser('admin')
newSecurityManager(None, user.__of__(app.acl_users))
from Products.CMFCore.utils import getToolByName
tt = getToolByName(portal, 'portal_transforms')
sh = tt.safe_html
sh._config['valid_tags']['figcaption'] = '1'
transaction.commit()
--- snip ---
