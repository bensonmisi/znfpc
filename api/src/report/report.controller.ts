import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards } from '@nestjs/common';
import { HasAccesslevel } from 'src/decorators/hasaccesslevel.decorator';
import { HasPermission } from 'src/decorators/hasPermission.decorator';
import { AccessLevelGuard } from 'src/guards/accesslevel.guard';
import { PermissionGuard } from 'src/guards/permission.guard';
import { JwtAuthGuard } from 'src/jwtsettings/jwt-auth.guard';
import { ReportService } from './report.service';

@Controller('api/admin/report')
@UseGuards(JwtAuthGuard,AccessLevelGuard,PermissionGuard)
@HasAccesslevel('ADMIN')
export class ReportController {
  constructor(private readonly reportService: ReportService) {}
   
  @Get('/ByAgent')
  @HasPermission('VIEW_REPORT_BY_AGENT')
  async viewByAgent() {
    return await this.reportService.getReportByAgent()
  }
  @Get('/ByService')
  @HasPermission('VIEW_REPORT_BY_SERVICE')
  async viewByService() {
    return await this.reportService.getReportByService()
  }

  
 
}
