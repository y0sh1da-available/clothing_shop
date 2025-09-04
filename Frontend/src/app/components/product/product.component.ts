import { Component, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ProductService } from '../../services/product.service';
import { Product } from '../../dto/product.dto';
import { Category } from '../../dto/category.dto';
import { Brand } from '../../dto/brand.dto';

@Component({
  selector: 'app-product',
  standalone: true,
  imports: [CommonModule, RouterModule, FormsModule],
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss'],
})
export class ProductComponent implements OnInit {
  products: Product[] = [];
  filteredProducts: Product[] = [];

  searchTerm = '';
  selectedMinPrice = 0;
  selectedMaxPrice = Infinity;
  selectedPriceLabel = 'Product price range';
  selectedCategoryId: number | null = null;
  selectedBrandId: number | null = null;

  currentPage = 1;
  pageSize = 6;

  suggestedProducts: Product[] = [];
  showSuggestions = false;

  categories: Category[] = [];
  brands: Brand[] = [];

  constructor(private productService: ProductService) {}

  ngOnInit(): void {
    this.loadAllProducts();
    this.loadCategories();
    this.loadBrands();
  }

  private loadAllProducts(): void {
    this.productService.getAllProducts().subscribe((data: Product[]) => {
      this.products = data;
      this.applyFilters();
    });
  }

  private loadCategories(): void {
    this.productService.getCategories().subscribe((data: Category[]) => {
      this.categories = data;
    });
  }

  private loadBrands(): void {
    this.productService.getBrands().subscribe((data: Brand[]) => {
      this.brands = data;
    });
  }

  applyFilters(): void {
    this.filteredProducts = this.products.filter((p) => {
      const matchName = p.name
        .toLowerCase()
        .includes(this.searchTerm.toLowerCase());
      const matchPrice =
        p.price >= this.selectedMinPrice && p.price <= this.selectedMaxPrice;
      const matchCategory = this.selectedCategoryId
        ? p.categoryId === this.selectedCategoryId
        : true;
      const matchBrand = this.selectedBrandId
        ? p.brandId === this.selectedBrandId
        : true;
      return matchName && matchPrice && matchCategory && matchBrand;
    });
    this.currentPage = 1;
  }

  searchByName(): void {
    this.searchTerm = this.searchTerm.trim();
    this.applyFilters();
    this.showSuggestions = false;
  }

  onSearchInputChange(): void {
    if (this.searchTerm.trim() === '') {
      this.suggestedProducts = [];
      this.showSuggestions = false;
    } else {
      this.productService
        .getProductsByName(this.searchTerm)
        .subscribe((data) => {
          this.suggestedProducts = data.slice(0, 20);
          this.showSuggestions = this.suggestedProducts.length > 0;
        });
    }
  }

  selectSuggestion(name: string): void {
    this.searchTerm = name;
    this.showSuggestions = false;
  }

  setPriceRange(min: number, max: number, label: string): void {
    this.selectedMinPrice = min;
    this.selectedMaxPrice = max;
    this.selectedPriceLabel = label;
    this.applyFilters();
  }

  filterByCategory(catId: number): void {
    this.selectedCategoryId = catId;
    this.applyFilters();
  }

  filterByBrand(brandId: number): void {
    this.selectedBrandId = brandId;
    this.applyFilters();
  }

  get paginatedProducts(): Product[] {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    return this.filteredProducts.slice(startIndex, startIndex + this.pageSize);
  }

  getTotalPages(): number {
    return Math.ceil(this.filteredProducts.length / this.pageSize);
  }

  pageChanged(page: number): void {
    this.currentPage = page;
  }
}
