<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PortfolioCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Toastr;

class PortfolioCategoryController extends Controller
{
    // Define properties
    protected $title;
    protected $route;
    protected $view;
    protected $path;

    public function __construct()
    {
        // Module Data
        $this->title = trans_choice('dashboard.portfolio_category', 1);
        $this->route = 'admin.portfolio-category';
        $this->view = 'admin.portfolio-category';
        $this->path = 'portfolio-category';
    }

    public function index()
    {
        //
        $data['title'] = $this->title;
        $data['route'] = $this->route;
        $data['view'] = $this->view;
        $data['path'] = $this->path;

        $data['rows'] = PortfolioCategory::orderBy('id', 'asc')->get();

        return view($this->view . '.index', $data);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        // Field Validation
        $request->validate([
            'title' => 'required|max:191|unique:portfolio_categories,title',
        ]);

        // Insert Data
        $portfolioCategory = new PortfolioCategory;
        $portfolioCategory->title = $request->title;
        $portfolioCategory->slug = Str::slug($request->title, '-');
        $portfolioCategory->description = $request->description;
        $portfolioCategory->save();

        Toastr::success(__('dashboard.created_successfully'), __('dashboard.success'));

        return redirect()->back();
    }

    public function show(PortfolioCategory $portfolioCategory)
    {
        //
    }

    public function edit(PortfolioCategory $portfolioCategory)
    {
        //
    }

    public function update(Request $request, PortfolioCategory $portfolioCategory)
    {
        // Field Validation
        $request->validate([
            'title' => 'required|max:191|unique:portfolio_categories,title,' . $portfolioCategory->id,
        ]);

        // Update Data
        $portfolioCategory->title = $request->title;
        $portfolioCategory->slug = Str::slug($request->title, '-');
        $portfolioCategory->description = $request->description;
        $portfolioCategory->status = $request->status;
        $portfolioCategory->save();

        Toastr::success(__('dashboard.updated_successfully'), __('dashboard.success'));

        return redirect()->back();
    }

    public function destroy(PortfolioCategory $portfolioCategory)
    {
        // Delete Data
        $portfolioCategory->delete();

        Toastr::success(__('dashboard.deleted_successfully'), __('dashboard.success'));

        return redirect()->back();
    }
}
