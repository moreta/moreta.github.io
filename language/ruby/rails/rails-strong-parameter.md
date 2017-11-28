Rails Strong Parameter
=====================

# permitで引っ掛かったときのjsonでresponse

<https://github.com/rails/strong_parameters/issues/157>

```rb
rescue_from ActionController::ParameterMissing do |exception|
  render json: {exception.param => "is required"}, status: 422
end
```