import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { TypeService } from './type.service';
import { CreateTypeDto } from './dto/create-type.dto';
import { UpdateTypeDto } from './dto/update-type.dto';
import { JwtAuthGuard } from 'src/jwtsettings/jwt-auth.guard';
import { AccessLevelGuard } from 'src/guards/accesslevel.guard';
import { PermissionGuard } from 'src/guards/permission.guard';
import { HasAccesslevel } from 'src/decorators/hasaccesslevel.decorator';
import { HasPermission } from 'src/decorators/hasPermission.decorator';

@Controller('api/admin/type')
@UseGuards(JwtAuthGuard,AccessLevelGuard,PermissionGuard)
@HasAccesslevel('ADMIN')
export class TypeController {
  constructor(private readonly typeService: TypeService) {}

  @Post()
  @HasPermission('CREATE_SERVICETYPE')
  async create(@Body() createTypeDto: CreateTypeDto) {
    return await this.typeService.create(createTypeDto);
  }

  @Get()
  @HasPermission('GET_SERVICETYPES')
  async findAll() {
    return await this.typeService.findAll();
  }

  @Get(':id')
  @HasPermission('GET_SERVICETYPE')
  async findOne(@Param('id') id: string) {
    return await this.typeService.findByService(+id);
  }

  @Patch(':id')
  @HasPermission('UPDATE_SERVICETYPE')
  async update(@Param('id') id: string, @Body() updateTypeDto: UpdateTypeDto) {
    return await this.typeService.update(+id, updateTypeDto);
  }

  @Delete(':id')
  @HasPermission('DELETE_SERVICETYPE')
  async remove(@Param('id') id: string) {
    return await this.typeService.remove(+id);
  }
}
