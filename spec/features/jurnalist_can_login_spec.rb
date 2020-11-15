feature 'User can login' do
    
    before do 
        visit root_path
        click_on 'Login'
    end

    context 'happy path: successfull login' do
        before do
            fill_in "Email", with: 'admin@example.com'
            fill_in "Password", with: 'password'
            click_on 'Log in'
        end

        it 'Admin gets redirected to homepage after successful login' do
            expect(current_path).to eq new_admin_session_path
        end

        it 'Admin can see Write an article' do
            expect(current_path).to have_content 'Write an Article'
        end
    end
end