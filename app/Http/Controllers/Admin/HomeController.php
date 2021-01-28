<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Category;
use App\Models\Product;
use App\Models\Order;
use App\Http\Controllers\Controller;
class HomeController extends Controller{
    public function index(){
        return view('admin.landingPage.index');
    }
}
