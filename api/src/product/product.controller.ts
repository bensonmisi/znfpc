import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { ProductService } from './product.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { JwtAuthGuard } from 'src/jwtsettings/jwt-auth.guard';
import { AccessLevelGuard } from 'src/guards/accesslevel.guard';
import { PermissionGuard } from 'src/guards/permission.guard';
import { HasAccesslevel } from 'src/decorators/hasaccesslevel.decorator';
import { HasPermission } from 'src/decorators/hasPermission.decorator';

@Controller('api/admin/product')
@UseGuards(JwtAuthGuard,AccessLevelGuard,PermissionGuard)
@HasAccesslevel('ADMIN')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Post()
  @HasPermission('CREATE_PRODUCT')
  create(@Body() createProductDto: CreateProductDto) {
    return this.productService.create(createProductDto);
  }

  @Get()
  @HasPermission('GET_PRODUCTS')
  findAll() {
    return this.productService.findAll();
  }

  @Get(':id')
  @HasPermission('GET_PRODUCT')
  findOne(@Param('id') id: string) {
    return this.productService.findByType(+id)
  }

  @Patch(':id')
  @HasPermission('UPDATE_PRODUCT')
  update(@Param('id') id: string, @Body() updateProductDto: UpdateProductDto) {
    return this.productService.update(+id, updateProductDto);
  }

  @Delete(':id')
  @HasPermission('DELETE_PRODUCT')
  remove(@Param('id') id: string) {
    return this.productService.remove(+id);
  }
}
