# Upgrade Bloggy
## 0.4.0 to 0.5.0
 - No update required


## 0.3.0 to 0.4.0
 - Change of syntax for configuration. Please use Bloggy::Config instead of the old Bloggy module


## from 0.2.x to 0.3
If you use `bloggy-markdown`, you must upgrade it first.
Once the gems has been upgraded to latest versions:

1. $`bundle exec rake bloggy_markdown:install:migrations`
2. $`bundle exec rake bloggy:install:migrations`
3. $`bundle exec rake db:migrate`

Then if you have customized some views, make sure that you are not using the `Bloggy::PostRevision` object that was removed in favor of the `Bloggy::Post` object.

IMPORTANT: Do not forget to run Deface's precompile rake task too! `bundle exec rake deface:precompile`

## from 0.1.0 to 0.1.1
 - once the gem has been upgraded to 0.1.1, run

1. $`bundle exec rake bloggy:install:migrations # this will remove mount point`
2. $`bundle exec rake db:migrate`

If you made changes in Bloggy's post views, you will want to change all `@revision.url` to `@revision.full_url` and `revision.url` to `revision.full_url`.
