import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Request } from '@nestjs/common';
import { InquiryService } from './inquiry.service';
import { CreateInquiryDto } from './dto/create-inquiry.dto';
import { UpdateInquiryDto } from './dto/update-inquiry.dto';
import { JwtAuthGuard } from 'src/jwtsettings/jwt-auth.guard';
import { AccessLevelGuard } from 'src/guards/accesslevel.guard';
import { PermissionGuard } from 'src/guards/permission.guard';
import { HasAccesslevel } from 'src/decorators/hasaccesslevel.decorator';
import { FilterDto } from './dto/filter.dot';
import { HasPermission } from 'src/decorators/hasPermission.decorator';
import { Inquiry } from './entities/inquiry.entity';

@Controller('api/admin/inquiry')
@UseGuards(JwtAuthGuard,AccessLevelGuard,PermissionGuard)
@HasAccesslevel('ADMIN')
export class InquiryController {
  constructor(private readonly inquiryService: InquiryService) {}

  @Post()
  @HasPermission('CREATE_INQUIRY')
  async create(@Body() createInquiryDto: CreateInquiryDto,@Request() req) {
    const user = req.user
    return await this.inquiryService.create(createInquiryDto,user.userId);
  }

  @Get()
  @HasPermission('GET_INQUIRIES')
 async findAll() {
    return await this.inquiryService.findAll();
  }

  @Get(':id')
  @HasPermission('GET_INQUIRY')
  async findOne(@Param('id') id: string) {
    return await this.inquiryService.findOne(+id);
  }

  @Patch(':id')
  @HasPermission('UPDATE_INQUIRY')
 async update(@Param('id') id: string, @Body() updateInquiryDto: UpdateInquiryDto,@Request() req) {
    const user = req.user
    return await this.inquiryService.update(+id, updateInquiryDto,user.userId);
  }

  @Delete(':id')
  @HasPermission('DELETE_INQUIRY')
 async remove(@Param('id') id: string,@Request() req) {
    const user = req.user
    return await this.inquiryService.remove(+id,req.userId);
  }

  @Get('/data/getCurrentByUser')
  @HasPermission('GET_CURRENT_BY_USER')
  async getCurrentByUser(@Request() req){
    const user = req.user
    return await this.inquiryService.getcurrentByUser(user.userId)
  }
  @Get('/data/getSummary')
  async getSummary(){
    return await this.inquiryService.getSummary()
  }

  @Post('/data/getSummary')
  async filterDate(@Body() filterDto:FilterDto):Promise<Inquiry[]>{
 
    return await this.inquiryService.filterData(filterDto)
  }

  
  @Post('/custome/getByUserCustom')
  @HasPermission('GET_BY_USER_CUSTOM')
  async getUserCustome(@Body() filterDto:FilterDto,@Request() req):Promise<any>{
     const user = req.user
    return await this.inquiryService.getByUserCustome(user.id,filterDto.start,filterDto.end)
  }

  @Post('/report/getCustomeReport')
  @HasPermission('GET_CUSTOM_REPORT')
  async getCustomeReport(@Body() filterDto:FilterDto):Promise<any>{
    return await this.inquiryService.geCustome(filterDto.start,filterDto.end)
  }
  @Get('/report/getByAgent/:id')
  @HasPermission('GET_BY_AGENT')
  async getReportByAgent(@Param()id:any):Promise<any>{
   return await this.inquiryService.getcurrentByUser(id)
  }
  @Get('/report/getByService/:id')
  @HasPermission('GET_BY_SERVICE')
  async getReportByService(@Param()id:any):Promise<any>{
   return await this.inquiryService.getByService(id)
  }



}
