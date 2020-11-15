feature 'User can login' do
    before do 
        visit root_path
        click_on 'Login'
    end

    context 'user can successfully login' do
        before do
            fill_in "Email", with: 'admin@example.com'
            fill_in "Password", with: 'password'
            click_on 'Log in'
        end

        it 'and gets redirected to homepage after successful login' do
            expect(current_path).to eq new_admin_session_path
        end

        it 'and gets a success message' do
            expect(current_path).to have_content 'Signed in successfully.'
        end

        context 'and successfull sign out' do
            before do
                click_on 'Sign out'
            end

            it 'show a success message when sign out' do
                expect(page).to have_content 'Signed out successfully.'
            end
        end
    end

    context 'User can sign up' do
        before do
            visit root_path
            click_on 'Sign up'
        end

        it 'and gets a success message' do
            expect(page).to have_content 'Welcome! You have signed up successfully.'
        end
    end 
end