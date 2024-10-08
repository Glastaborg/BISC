<?php

use App\Models\About;
use Illuminate\Database\Seeder;

class CreateAboutTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('abouts')->delete();
        
        $about = About::create([

            'title'=>'About Us',
            'slug'=>'about-us',
            'description'=>'HiTech multipurpose business website CMS (Content Management System), Which is fully customizable and 100% dynamic. By using our powerful Admin panel you can manage About Us (Inc. Mission & Vision) and Contact Page Details very easily. You can manage your website Sliders, Portfolios / Projects (Gallery), Services, Partners / Clients, Pricing Packages / Plan, Testimonials / Reviews, Team Members, FAQ’s (frequently asked questions) / Knowledge Base, Blog / News Posts, Work Process, Features / Why Choose Us, Counters, Messages / Emails, Subscribers List, Others Custom Pages, Social Profiles & More.',
            'image_path'=>'about.png',
            'mission_title'=>'Our Mission',
            'mission_desc'=> 'Our mission is to provide expert intelligence and security consulting services, through a team of highly trained and dedicated professionals and best practices, while upholding the highest standards of integrity, reliability, and customer satisfaction.',
            'vision_title'=>'Our Vision',
            'vision_desc'=> 'To be the leading and trusted provider of comprehensive security solutions, mitigate complex security risks, empower informed decisions, and stay ahead of emerging threats in an ever-evolving landscape.
',
            'status'=>'1'
            
        ]);
    }
}
