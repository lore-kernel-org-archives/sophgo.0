Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446381EB187
	for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945162; cv=none; b=CNILQnwFHlrZopVRhMgwdYdyhLi/AyWUR5z+D97nlKDopzRze7aNl7NfMoMV4eKZbLyRn74LKgWCuQj2ctFAUMwHHPa+IwbTe3DIJ/TR/sOnbICzi7a37teM0vpo1MK9JTC6vtfZbi4rnMLlSs7rOHvcheL1w5xkOlk8VN8xD9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945162; c=relaxed/simple;
	bh=5QVN7CNT/TzWa0C8un5ji1yuhk1EE722SrLc52k/u0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elc+bDysmhjJoChKhYs1ffp2/7gBQuRejCNIEUxh6LMHQ+4psqEr4hAPk38eFUMpWKv5wGLXePTptWz90GmHh30Y2A/QxR+bfSAGIM9bb+dsnY4opyODxAPuOmvr5JfpgA8lZSE0nr1TPCKlor7mL2KHYWlZ6FcrsoRcCeAf4Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVq274Xs; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVq274Xs"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5568355ffso155319585a.0
        for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741945159; x=1742549959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfevu07Vpa7hwgRCobCYOrdydWkG3wRjRYWAplZ0bYE=;
        b=dVq274XsGNpGWMt4CdXE4Xi8y+Kk2izC4Y1srAOaXiHT1ELbaS2HGsM1c9bB03tFGr
         TtYm2ax3uU2IqOzq/W65GhWJqLwP3nFutvJZe9tmnq+mYXjRtujDZvF7nOinoDfIQRp0
         Jw5d4e7T+xqZfuJJ0uscMYRXRDcw51ZkZ74W6/pXb+Bhi5gD35e1P1oS6TmFbxzeUcgU
         hrHzW0IO8QEVrbo1T2wJd9LoPIT5e/wCle5vaHh9eARAEtqT3rfm3FBYv24CS/3jbGjo
         Q0PLDqfr/lL896B9RDESdvoCkOp4LtANTQnRBpUXmZ1n6faEzpO8h672clq7SieOCTGX
         ob/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945159; x=1742549959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfevu07Vpa7hwgRCobCYOrdydWkG3wRjRYWAplZ0bYE=;
        b=TeO9qDO6ClbBbKvpJKQ5kccsePgt6E3WCGdsT2gMsoxCcoSotQIcy440MYFdE3gWNG
         VQWLI/YKnL9Ywnjo8kcEjM5p2eU0hqzHIOFJVBI00ppm0t00MAzXpu/M7VgLWpBAbTEV
         /Q3oXRmpLcZgBWMkA8t02tG7XS3hIkc+8WeJCp7zud6t7wCrrZj/E4VCjQZe4kIQnFlm
         BiwJm0p6DdOpynVdAcizR0MXjL6Kt+mYRL4xtub+nBQ9OLfInEDqCQbi0fthEyFUcHhF
         qRDUPKMysrN4UPFgLVSCI6P8b9yXhvSXfEbjP4eOdBIWOZ+1Xtv0BI664ejn8FyGpxXX
         zgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkzxe4SCZrOr+sqoRWcUXWF7gYLKHAABjXnc/HVpxZkcsJzHs+mrU4U1VXXD+PycJZIksarlI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLZoJDlZLcpCdmHME3WGFYWEd36I2AYe6dIkkJppevdIry70N6
	6V/3SbF3GBvexbiBsbXwYrzoMmHNXhVidqpHVBSYYQcDwAA/NCtO
X-Gm-Gg: ASbGncuVEA+/2Vy9Z6Wbh+cRZIuxH8nsQFRD6YV85nFMYxyCeleLUchIr90fSTTBrbt
	fiBS/t6fqbV4Y0TflaRklzXKwp/Ke9dztjBIkbzQOI954jdHGd9TiX2ncSqHHf9QfTlhlAQE1Ym
	ckOyKf2R2cPJLMhytMc2ZH0k+VtcTaGsu5ef0CBLl4X7BU1SvUU3uW2BE1Jux6KYW0wQ8GXy4lj
	UwSylrqwHLe/InaHkIqiUvDtDpKfPIwkJgD6AmbRbkcj+CMpjxi61cZ/nFevO/yvuXWjjR2q2cF
	Op38WXevKHwWyRB4MrfH
X-Google-Smtp-Source: AGHT+IEvr/9zZBoMHVrdiXspi/YS5RCN+/h43b7k2lH9T05dCKjUpdrZxmZoQRHlNmQ78IiJMl6eJg==
X-Received: by 2002:a05:620a:4386:b0:7c3:d5c6:d34f with SMTP id af79cd13be357-7c57c80ef9dmr226283585a.32.1741945159129;
        Fri, 14 Mar 2025 02:39:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573c9c6f3sm225051585a.63.2025.03.14.02.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:39:18 -0700 (PDT)
Date: Fri, 14 Mar 2025 17:39:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <r7uyz4hvwxqzl7jv2wo5dll4pckkk4as5zbtc3w3aszpk652ps@nlmadkaorght>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
 <2d1995d39ac050eeb7cec4183ebdb307e520a7c7.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d1995d39ac050eeb7cec4183ebdb307e520a7c7.camel@gmail.com>

On Fri, Mar 14, 2025 at 10:31:09AM +0100, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Fri, 2025-03-14 at 08:51 +0800, Inochi Amaoto wrote:
> > On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> > > Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> > > comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> > > machine to control chip power-on, power-off and reset. Furthermore, the
> > > 8051 subsystem is located within RTCSYS including associated SRAM block.
> > > 
> > > This patch only populates RTC sub-device.
> > > 
> 
> ...
> 
> > > +++ b/drivers/soc/sophgo/cv1800-rtcsys.c
> > > @@ -0,0 +1,63 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Driver for Sophgo CV1800 series SoC RTC subsystem
> > > + *
> > > + * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module,
> > > + * HW state machine to control chip power-on, power-off and reset. Furthermore,
> > > + * the 8051 subsystem is located within RTCSYS including associated SRAM block.
> > > + *
> > > + * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > + *
> > > + */
> > > +
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/property.h>
> > > +
> > > +static struct resource cv1800_rtcsys_irq_resources[] = {
> > > +	DEFINE_RES_IRQ_NAMED(0, "alarm"),
> > > +};
> > > +
> > > +static const struct mfd_cell cv1800_rtcsys_subdev[] = {
> > > +	{
> > 
> > > +		.name = "cv1800-rtc",
> > 
> > Make this a specifc one, like "sophgo,cv1800b-rtc"
> 
> Could it be that you mixed up device instance name and "compatible"?
> 
> Please refer to all other MFD cells with `grep -C3 -R -F "struct mfd_cell"`
> either in drivers/soc or in drivers/mfd, there are no vendor prefixes in the
> names.
> 

Yeah, I misunderstand this, but at least please specific name as 
"cv1800b-rtc". This is more accuracy.

Regards,
Inochi
