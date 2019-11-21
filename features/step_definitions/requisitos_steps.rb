Dado /^que eu estou na "([^\"]+)"$/ do |path|
    if path == "home"
        visit root_path
    elsif path == "página de login"
        visit new_user_session_path
    end
end


Dado /^que eu estou logado como "([^\"]+)"$/ do |user|
    # User.destroy_all
    # User.create(full_name: "Secretário", email: "secretary@secretary.com", password: "admin123", role: "secretary", registration: "000000000")
    # User.create(full_name: "Professor", email: "professor@professor.com", password: "admin123", role: "professor", registration: "000000000")
    # User.create(full_name: "Aluno", email: "student@student.com", password: "admin123", role: "student", registration: "000000000")
    if user == "administrador"
        User.create(full_name: "Administrador", email: "admin@admin.com", password: "admin123", role: "administrator", registration: "000000000")
        email = "admin@admin.com"
        senha = "admin123"
    end
    steps %Q{
        Dado que eu estou na \"página de login\"
        Quando eu preencho o campo \"user_email\" com o valor \"#{email}\"
        Quando eu preencho o campo \"user_password\" com o valor \"#{senha}\"
        E eu aperto no botão \"Entrar\"
    }
end

Quando /^eu preencho o campo "([^\"]+)" com o valor "([^\"]+)"$/ do |campo, valor|
    fill_in(campo, :with => valor)
end

E /^eu aperto no botão "([^\"]+)"$/ do |botao|
    click_button(botao)
end

Dado /^que eu estou na "([^\"]+)" e eu estou logado como "([^\"]+)"$/ do |path, user|
    steps %Q{
        Dado que eu estou logado como \"#{user}\"
        Dado que eu estou na \"#{path}\"
    }
end

Quando /^eu clico no link "([^\"]+)"$/ do |link|
    click_link(link)
end

Então /^eu espero ver "([^\"]+)"$/ do |texto|
    expect(page).to have_content texto
end