import { Body, Controller, Post } from '@nestjs/common';
import { InstallDto } from './dto/install.dto';
import { InstallService } from './install.service';

@Controller('install')
export class InstallController {
  constructor(private readonly installService: InstallService) {}

  @Post()
  async create(@Body() installDto:InstallDto){
    return await this.installService.install(installDto)
  }
}
