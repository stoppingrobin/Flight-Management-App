# README

# Ruby on Rails Application

This is a simple Ruby on Rails application that integrates Devise, Action Mailer, and Bootstrap in order to manage some flight bookings.

## Configuration

Follow these steps to configure and start the application:

1. Make sure you have Ruby (version 3.2) and Rails (version 7.0) installed on your system.

2. Clone this repository to your local machine.

   ```shell
   git clone https://github.com/stoppingrobin/flightManagement
   ```

3. Navigate to the project directory.

   ```shell
   cd flightManagement
   ```

4. Install the required gems by running the following command:

   ```shell
   bundle install
   ```

5. Configure the database by modifying the `config/database.yml` file to match your database settings (e.g., username, password, etc.).

6. Run the database migrations:

   ```shell
   rails db:migrate
   ```

7. Set up the initial data (if any) by running the appropriate seeds:

   ```shell
   rails db:seed
   ```

8. Set up your mailer configuration by modifying the `config/environments/development.rb` file. Update the SMTP settings to match your email provider (e.g., Gmail, SendGrid, etc.).

9. Start the Rails server:

   ```shell
   rails server
   ```

10. Open your web browser and navigate to `http://localhost:3000` to access the application.

## Usage

Once the application is up and running, you can perform the following actions:

- While unconnected, you can view the incoming flights and choose one to start booking. You will need to sign up to continue booking.
- Sign up as a new user by clicking on the "Sign Up" link in the navigation bar.
- Log in to your account using your registered email and password.

## Dependencies

The application relies on the following dependencies:

- Ruby
- Rails
- Devise
- Action Mailer
- Bootstrap

Make sure to have these dependencies installed and properly configured before running the application.

## License

This project is licensed under the [MIT License](LICENSE).

