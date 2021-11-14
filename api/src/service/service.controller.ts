import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { ServiceService } from './service.service';
import { CreateServiceDto } from './dto/create-service.dto';
import { UpdateServiceDto } from './dto/update-service.dto';
import { JwtAuthGuard } from 'src/jwtsettings/jwt-auth.guard';
import { AccessLevelGuard } from 'src/guards/accesslevel.guard';
import { PermissionGuard } from 'src/guards/permission.guard';
import { HasAccesslevel } from 'src/decorators/hasaccesslevel.decorator';
import { HasPermission } from 'src/decorators/hasPermission.decorator';

@Controller('api/admin/service')
@UseGuards(JwtAuthGuard,AccessLevelGuard,PermissionGuard)
@HasAccesslevel('ADMIN')
export class ServiceController {
  constructor(private readonly serviceService: ServiceService) {}

  @Post()
  @HasPermission('CREATE_SERVICE')
  create(@Body() createServiceDto: CreateServiceDto) {
    return this.serviceService.create(createServiceDto);
  }

  @Get()
  @HasPermission('GET_SERVICES')
  findAll() {
    return this.serviceService.findAll();
  }

  @Get(':id')
  @HasPermission('GET_SERVICE')
  findOne(@Param('id') id: string) {
    return this.serviceService.findOne(+id);
  }

  @Patch(':id')
  @HasPermission('UPDATE_SERVICE')
  update(@Param('id') id: string, @Body() updateServiceDto: UpdateServiceDto) {
    return this.serviceService.update(+id, updateServiceDto);
  }

  @Delete(':id')
  @HasPermission('DELETE_SERVICE')
  remove(@Param('id') id: string) {
    return this.serviceService.remove(+id);
  }
}
