from setuptools import setup, find_packages

version = '0.1'

setup(
    name='plone.app.aloha',
    version=version,
    description="Provide an auto-complete Change Note field for CMFEditions",
    long_description=open("README.txt").read(),
    # Get more strings from http://pypi.python.org/pypi?%3Aaction=list_classifiers
    classifiers=[
        "Programming Language :: Python",
        ],
    keywords='rotator slideshow',
    author='Izak Burger, Upfront Systems',
    author_email='izak@upfrontsystems.co.za',
    url='https://github.com/izak/plone.app.aloha',
    license='GPL',
    packages=find_packages(exclude=['ez_setup']),
    namespace_packages=['plone', 'plone.app'],
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'setuptools',
        'Products.CMFPlone',
        'plone.app.jquerytools',
        'plone.app.jquery',
    ],
    entry_points="""
        [z3c.autoinclude.plugin]
        target = plone
    """,
    setup_requires=["PasteScript"],
    paster_plugins = ["ZopeSkel"],
    )
