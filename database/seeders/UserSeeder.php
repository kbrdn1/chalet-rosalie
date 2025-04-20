<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    $adminLastname = Env("ADMIN_LASTNAME");
    $adminFirstname = Env("ADMIN_FIRSTNAME");
    $adminEmail = Env("ADMIN_EMAIL");
    $adminPassword = Env("ADMIN_PASSWORD");

    if ($adminLastname && $adminFirstname && $adminEmail && $adminPassword) {
      $this->dumpSuperAdminFromConfig();

      $data = [
        "lastname" => $adminLastname,
        "firstname" => $adminFirstname,
        "email" => $adminEmail,
        "password" => Hash::make($adminPassword),
        "phone_number" => null,
        "enabled" => true,
      ];

      User::factory()->create($data);
    } else {
      echo "Admin user not created. Please ensure all required environment variables are set.\n";
      echo "Run `php artisan config:clear` to refresh the configuration cache and try again.\n";
    }
  }

  /**
   * Dump the super admin details from the configuration.
   *
   * @return void
   */
  private function dumpSuperAdminFromConfig(): void
  {
    $adminDetails = [
      "Lastname" => Env("ADMIN_LASTNAME"),
      "Firstname" => Env("ADMIN_FIRSTNAME"),
      "Email" => Env("ADMIN_EMAIL"),
      "Password" => Env("ADMIN_PASSWORD"),
    ];

    echo "\nAdmin user created with the following details:\n\n";
    foreach ($adminDetails as $key => $value) {
      echo "  - {$key}: {$value}\n";
    }
  }
}
