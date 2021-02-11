# REWORD BACK

## Gems

## RSpec

```cmd
docker-compose run web rspec
```

## Rubocop

```cmd
docker-compose run web rubocop --auto-correct
```

## Credentials

```cmd
docker-compose run web rails credentials:edit

heroku config:set RAILS_MASTER_KEY=`cat config/master.key`
```

## production

- [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth)
- [ransack](https://github.com/activerecord-hackery/ransack)
- [kaminari](https://github.com/kaminari/kaminari)
- [carrierwave](https://github.com/carrierwaveuploader/carrierwave)
- [rmagick](https://github.com/rmagick/rmagick)
- [fog-aws](https://github.com/fog/fog-aws)
- [stripe](https://github.com/stripe/stripe-ruby)
- [rack-cors](https://github.com/cyu/rack-cors)
- [api-pagination](https://github.com/davidcelis/api-pagination)
- ~~[olive-branch](https://github.com/vigetlabs/olive_branch)~~ テストがやりにくい

## development

- [rubocop-airbnb](https://github.com/airbnb/ruby/tree/master/rubocop-airbnb)
- [rspec-rails](https://github.com/rspec/rspec-rails/tree/4-0-maintenance)
- [factory-bot_rails](https://github.com/thoughtbot/factory_bot_rails)
- [faker](https://github.com/faker-ruby/faker)
- ~~[fog](https://github.com/fog/fog)~~ ワーニングが発生する

## SEO

- [sitemap_generator](https://github.com/kjvarga/sitemap_generator)

## Routes

|verb|uri|params|response|
|:--:|:--:|:--:| :--:|
|PUT/PATCH|/user/profile|headers|Profile|
|PUT/PATCH|/user/reword|result/count/headers|Reword|
|GET|/users|q/page |Users|
|GET|/users/:id|id|User|
|GET|/users/latest|page|Users|
|GET|/users/ranked|page|Users|
|GET|/reword/info|none|RewordInfo|