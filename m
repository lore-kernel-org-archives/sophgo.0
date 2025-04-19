Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960992AE96
	for <sophgo@lists.linux.dev>; Sat, 19 Apr 2025 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745048172; cv=none; b=aye+q2utIyNL72LRB3EJcil5sx986OPDvcQN7zBfiRRHyyKYxoyLBLOs9uZHPFeGq73v8Qqc/Yg5zucJ4fAQy1hQIAfou2XmucZDMSXq4USWTBq/zVJfaWmeTSmhj+3IvrWwvTHSZr+djnao6StBks5h49YP725kEvZurRen0os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745048172; c=relaxed/simple;
	bh=YBK6y7m3vZOAQqF+Bkk1DHbXXrlb3AtVna7xej1bwYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVsrYI8xcfrQrLF+zADCz1WwJzBu199/gwrrfUrCDEIUG1F0qF1soq9hlFrkgAdvEqf59IPeSV0+h2nR6MQTCLLDy2No7nwWQERfBQjiOhGESoPHgHpYQuH6bBC9RRp5D7P7mgDOsDRsXgTUyVo8fhzPy2eQhHjgrS2GNTaSBR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OujSbtPY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OujSbtPY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22409077c06so35026465ad.1
        for <sophgo@lists.linux.dev>; Sat, 19 Apr 2025 00:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745048170; x=1745652970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VbNMv8EcDVNc7S53ITN7O5grQN0Xg+vZe4s9ox5YAkY=;
        b=OujSbtPYWMuF8uCq+pxE2HibVpbJKC6/bHqEutV4owEeJ5bHP+9WXsvvmeM/GdZ2ic
         eICeYeqR71Nzx58KoWuKrXyDuSPtsFuu9a3yqcCS4CKXHpJHmoaEzZZ26/7abC60JeWl
         jknDVboieA/qQ0q6LBgFZQYkKrAGs2395myZl3+C1T1mJfvl/5sk/UTGCJvKHPiLwGJS
         4ugJfhx++c88yrBOkxq4lpLIMG+Vd/KQsK5EHY0Q/uvHFsyB/ikCqphnNzMjW6zlTwzQ
         BuWOjqib/+xrzD8bUGwSI9E93DUvRKHp+C3U76w2YW208tI3os/tNJPWPN3hKhr07Jhm
         XdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745048170; x=1745652970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbNMv8EcDVNc7S53ITN7O5grQN0Xg+vZe4s9ox5YAkY=;
        b=lGo/ruuQl38IDJ0eitOZUOtDbQAo7pDThbApkGdhzWE0Kf6cbTnr9TBraYPXGjp4zS
         b8mZGi13cQtsQRNPqX5Z/Ai+/a2Ki5cQo1MLsZUbSkftCmJuTm1tYhxVdJFT4cJumJrO
         ves6HAXUzTsczkrxI+CI3q6W2rPz4eT6mgQPK12grCLNY5sJQTbqMxiJ6O4kIB7FZyj1
         dgvVuHYQKVOesFa8ZXVXPijWxmzipAtB7+7BpHTxQE01nevh7zLRAqCJZK49yg8YBx8T
         ZWr11YH1+PBvgwYJZb+yJB7GrcifEqCpuVbteRnjQOcTn/vnOP7YLdF6j6QLuz2BSMqU
         N+mg==
X-Forwarded-Encrypted: i=1; AJvYcCW0KXIIOerOmqWx/ehK2cjRyTGB2m/a98pQfZkI6U3OINPwcmERC5hRF/7C0Jol6iOu9RhhnEo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtedWgVmIqjJvK/1OcLXHAGbfA51hxHXIrrYMzIKtxYOexOvPI
	S2M0puxwTOUG3BlZqE8QbWgifk9loXCV3PJ+wcRZxCZWg6QSVMzo
X-Gm-Gg: ASbGncvsgtL7GiwKtpy2GQG3KwufPJv/31YPtS1tiFLjzvSx4d5E0Sy9AUnJ0ClWpKO
	yhUWRZYgpF+P9E8PapjBT68KK13ijXogwCWiMyvMt6eSpAAgpzko98a4bSwBCDV49hKapSTqAah
	vH3k3SuY17Q7mKP449ZfjcTealU5y6A/bk9o/Pn80b17HWknMIvHaY+Vlk5ZKg6/hsjDx6xd0PM
	94NgGWiBs+/FQMCVUvzGt8wPjPWNrQh7jPMw3cKqq6pkm6P+asCLe0ytnzw5HbO1gKjodFwQzK8
	Q/pvwdsqQx1y23XXRihyVATZrqFwxX82EGJ6oZHWlw==
X-Google-Smtp-Source: AGHT+IE8gk3khKs6q2QV88hzoLFK8V9guTrvMWRFQ6JyDLTYcHlv4zmRal3/vUFMXM/1CNJJOpJ0+w==
X-Received: by 2002:a17:902:e549:b0:224:376:7a21 with SMTP id d9443c01a7336-22c536076f3mr77627655ad.42.1745048169844;
        Sat, 19 Apr 2025 00:36:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c50ed0f7asm27997115ad.169.2025.04.19.00.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 00:36:09 -0700 (PDT)
Date: Sat, 19 Apr 2025 15:36:05 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] pwm: sophgo: add driver for SG2044
Message-ID: <pat3f5nc57uo6p7vwmlrky6ezxhtn3qldmx3falmc4hv5beyyj@r2jfmuxtx5pi>
References: <20250418022948.22853-1-looong.bin@gmail.com>
 <20250418022948.22853-4-looong.bin@gmail.com>
 <MA0P287MB2262E14F6F9758646320F7CBFEBE2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262E14F6F9758646320F7CBFEBE2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Sat, Apr 19, 2025 at 09:24:23AM +0800, Chen Wang wrote:
> 
> On 2025/4/18 10:29, Longbin Li wrote:
> > Add PWM controller for SG2044 on base of SG2042.
> > 
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >   drivers/pwm/pwm-sophgo-sg2042.c | 89 ++++++++++++++++++++++++++++++++-
> >   1 file changed, 87 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
> > index 23a83843ba53..26147ec596c9 100644
> > --- a/drivers/pwm/pwm-sophgo-sg2042.c
> > +++ b/drivers/pwm/pwm-sophgo-sg2042.c
> > @@ -13,6 +13,9 @@
> >    *   the running period.
> >    * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
> >    *   be stopped and the output is pulled to high.
> > + * - SG2044 support polarity while SG2042 does not. When PWMSTART is
> > + *   false, POLARITY being NORMAL will make output being low,
> > + *   POLARITY being INVERSED will make output being high.
> >    * See the datasheet [1] for more details.
> >    * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
> >    */
> > @@ -26,6 +29,10 @@
> >   #include <linux/pwm.h>
> >   #include <linux/reset.h>
> > 
> > +#define SG2044_REG_POLARITY		0x40
> > +#define SG2044_REG_PWMSTART		0x44
> > +#define SG2044_REG_PWM_OE		0xD0
> 
> SG2044_REG_xxx, the prefix looks inconsistent with
> SG2042_PWM_HLPERIOD/SG2042_PWM_PERIOD. Can it be unified?
> 
> The others look fine.
> 
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> 
> [......]
> 
> 

I will rename it to unify, thanks.

Best regards,
Longbin Li
