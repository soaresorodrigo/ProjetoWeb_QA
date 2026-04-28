class LoginPage
  include Capybara::DSL


  def initialize
    @user_field = '#user-name'
    @pass_field = '#password'
    @login_btn  = '#login-button'
    @error_msg  = '.error-message-container'
  end

  def load
    visit '/'
  end

  def log_in(user, password)
  find(@user_field).set(user)
  find(@pass_field).set(password) # Se o Ruby reclamou aqui, é porque ele não reconheceu a variável 'password'
  find(@login_btn).click
  end

  def has_error?(message)
    has_css?(@error_msg, text: message)
  end

  def has_products_title?
    has_content?('Products')
  end

  def logout
    find('#react-burger-menu-btn').click
    find('#logout_sidebar_link').click
  end

  def has_login_page?
    has_css?('#login-button')
  end

end