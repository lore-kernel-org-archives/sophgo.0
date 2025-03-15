Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AA019ABD8
	for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078508; cv=none; b=rJV+yZ52aibvufvIlLMUWucHXdQ6CfrQTnHZpnDFFOxxVysET0UJTPtEic+gMX1fl1CjvUDSqVeGxFJcrpQ94R9+GWvlfGGqaXNpNIFWSOJlQtOeehvgzNfL+/Oty6ZM94TV14t8rxShD2eb2ogQCiAtTEJvnrcGtgchyYROzbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078508; c=relaxed/simple;
	bh=Jf571fJFmte/DhZSthgmF2b40O1xMlotcPyEIOLl2JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L87bHdTiAgtZkBwLR2AGIhjhhfRaXlbjprAaQhIENvSaVuItbOOMyckFEL2z+q++iT6vgE4bwIstN9OOV7J5+SFOgSZ3ERxjXQA7xqijk6PjbbKKk/+ZMo7qKsFs+EK/w35+p9kUW4r48HfqgCtzOezFJdqGo2t/sQmOijYZLI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBIkSTIF; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBIkSTIF"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476977848c4so34908211cf.1
        for <sophgo@lists.linux.dev>; Sat, 15 Mar 2025 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742078506; x=1742683306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3oY+38sr/sTYloBDx1wzQcavdV7QLVIJiTk4O6N85+c=;
        b=WBIkSTIFqlyzsOhJLT2ZnXt2SvRvgbTBUDhOuLoKcOr7SaqthNbhJ2rf9KCRJ1ky63
         3K+N9IXj2gDc/PFNR9kqrwuHaD6pRXTdfY0z5Ck/5FGPbhkIHkkEdoRkinUBJdEggROK
         zCLtmG77tQcqcPyOLqAGWhkFFS6BDNE37nGksIedHG7qAY+HTbObC1pqarcUBuwEXHtP
         gF4qkUBlg1NygsMZttToyx4R5qaDuHlmMBY0EZdovU0clOl8VefMmzQ5felds0tZygSx
         Ql4AiQy+Ur4CO7Rx81JJh5UCvEU/ngfoeTVgLvmtAG1c/SOEBrFFG/D53Ck4ow4/Q+1Y
         8Bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078506; x=1742683306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oY+38sr/sTYloBDx1wzQcavdV7QLVIJiTk4O6N85+c=;
        b=TZezZygggNf3X1p5rmf5AWa8V41ZkuTT1kiiDR97UWULh10knUKz1nywlzGKBL3ybJ
         SZoVc2cOpl7JtfJfPFT1oPv55cYaGyRFIPnUl1YsdMtQB2rpHR/N925qBFdvn1WJUity
         zqoTeFcT0ziXcLZpWpa5Wbg+ajfIHQcfFhn0hJj3lnT+eaYKUHvxGM8iTiq8QyKnvjys
         t0QJuT1rWDW5wIPQrouambw+Y1Xxt/szhE5uAg617xR1XmD5JRcJHBnSpkB3GuVJzXwc
         EsHkcl2xnpL4nQBXHQy2MzVTg2eTql+Eywkkbo2IC1M7Duw4q6SivX8sDMnJ7RSbud8u
         2saw==
X-Forwarded-Encrypted: i=1; AJvYcCU81S4a422Ajn+bTwwNrKs715Rx2mSi4x+dAW/6pNTCoRN4cKmf3Oz3lL6EityrzeCNgVsc2tE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMf1P5tE9fXjt0O+uWhGIyc/kiCzcpAEzqtqLgpaf90BX9CSaa
	yEWzXkkm5L9tQZuNYpxXBZ2VClk4Rt0AzJGOKgokjBEn0XFkHcBOdHh6kBNV
X-Gm-Gg: ASbGncsRj6/l027aTlsDpB6kjXYrPzQ7beeunjker0tIZ/DWsr5XIiBgg4awxIbkJk2
	kymjVXno5uoEDtJJcOHEGeUzkJ/Sd+lV9ajtFsVeUcWRU6gdn8qu5NKLjt95FUaUALKqRuHJhYn
	m0Sc3COc55lSuaTAp0G1Nn+nbNDKfU/Ra+kYlsTBGXQ7KyCmHpQJhXDzYu1Utb8W1L/DbWzmqyw
	s3PtOGOMD1rjtxiC666/Hbmja6k0p8PltFyd1uGniRedhDpaMrO+iUdCIFk6bO72/dKo1NPEXq2
	r/oTndPdF/vySDF646Zc
X-Google-Smtp-Source: AGHT+IGOFiRVhdZ/eu0TanCLon0McdNf078cGTf/0sdx3EdLrOVY3VTRn/83W7DGE+QGDjUd1bR0sQ==
X-Received: by 2002:ac8:5d91:0:b0:476:980c:109f with SMTP id d75a77b69052e-476c814a250mr128589231cf.19.1742078505965;
        Sat, 15 Mar 2025 15:41:45 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-476bb60aac8sm38208641cf.15.2025.03.15.15.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:41:45 -0700 (PDT)
Date: Sun, 16 Mar 2025 06:41:32 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <5txsmekwqy6a64fafatnttbu2kj7ztrdbhptzw4cp42rht6kjn@wqcr3ljmyv57>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
 <99b7f8181abda40c78bab67cb5a4b00b62851b14.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99b7f8181abda40c78bab67cb5a4b00b62851b14.camel@gmail.com>

On Sat, Mar 15, 2025 at 04:55:57PM +0100, Alexander Sverdlin wrote:
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
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> ...
> 
> > > +++ b/drivers/soc/sophgo/Kconfig
> > > @@ -0,0 +1,24 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Sophgo/Cvitek SoC drivers
> > > +#
> > > +
> > > +if ARCH_SOPHGO || COMPILE_TEST
> > 
> > > +menu "Sophgo/Cvitek SoC drivers"
> > 
> > No Cvitek, only left Sophgo here.
> > 
> > > +
> > > +config SOPHGO_CV1800_RTCSYS
> > > +	tristate "Sophgo CV1800 RTC MFD"
> > 
> > > +	default y if COMPILE_TEST
> > 
> > I do not think it is necessary.
> 
> Maybe it should have been
> 
> tristate "Sophgo CV1800 RTC MFD" if COMPILE_TEST
> 
> like others do?
> 

No, you needn't. The first line "if ARCH_SOPHGO || COMPILE_TEST"
already does the expected things. This is equal to remove this 
"if" and add a line "depends on ARCH_SOPHGO || COMPILE_TEST" to
this entry. Just remove the default line, and everything is OK.

Regards,
Inochi
