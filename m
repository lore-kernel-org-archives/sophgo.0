Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB95264F9A
	for <sophgo@lists.linux.dev>; Thu,  1 May 2025 22:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746138237; cv=none; b=PJmBNI09Txq/lNWntvV6tQKuErDBl7gfNCYOXN3OOITtvGOr+PKiRVV8UAr6G3KN3Rv4IKfvZrH0CeCMJg7YPq4sAIL5zD4p8DxxYdaavPVWXlX+9foALe+caBe04RrHDYVKyv/9E+rWcIUNll4kXo2Drg7k6V3yVqRpyO1leOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746138237; c=relaxed/simple;
	bh=AdvIjQi/4aXBUrayVTQs3uaVb4+2LoBxWLRuzajDxIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQluXFNjNtiqNuvDBnqwrX7w3pUM4H6gpygKv281bPYidHZsRWvGMLMOfGqtWGk+FNrIICsseyrvoOjS+CWrvxJFmn8OwQN1XIhmNC2vz3VxSfaak8+qwUUszKX4jtYbdL75+YNGegsIXYOd8UcBQNgrZfMrVWkxns9Uy4QXBto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P12cquyd; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P12cquyd"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c54b651310so216612985a.0
        for <sophgo@lists.linux.dev>; Thu, 01 May 2025 15:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746138234; x=1746743034; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALJpzUTq/FKpZ6ZIbBrWjDg3p3NoIlcuclCH+vNu1Do=;
        b=P12cquydTpq4Ox+xm/9KXsPAhKRfZH+XjCrxN7hBDBwg2VsiVFq5FlAm3ooDtMBjpq
         v/IevPnI15eFI0o98nBHT50M5lRNlk64xbW+b8XcKA4jEKzuQM6VHqqyi4lP1yV08ALg
         axPOiRv1nrGjkRuXXYXCKBmKz7zGt7Lv334285TADokUSNEFqiZmjIrBsdY7BcbLooap
         vx9f2g2GTdJ5hbP8brMVozqYFD4PNaA4DCH9IjAqlmro7lZTmabW5wygVGl0CsDPg8Ay
         mpf1Qub+Xw4HG2UtkaEK7PD71lSYdD71nunmWE/OJfqrcGLRGlfH7Lpzzc3x0tGU17n5
         2Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746138234; x=1746743034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALJpzUTq/FKpZ6ZIbBrWjDg3p3NoIlcuclCH+vNu1Do=;
        b=ikTExGcLVH9rGarkcvSRg+RXWrxcgQVVqlSxHfk9/pxqN0uxHsx1AlsRnlGixYZfMY
         xS7OBcp7CHGCv9X3CTLoGg3ZV1E8SAIKqX616SkEG+9feAzOn2BwQtV9hTQmEipNwArQ
         Wc7v/pdKRc7GJPVvQ601uGgYDX9tZf71an139/vvUkkq9Aixdu6juojYs9ssZMLhhhCA
         9IOznfySvPlRzLLTQw9KLTyNs/AFuXUqUauzIfkqStUUNC8AhiWM+/NeTd4CN+vNwwB9
         Ql0iT44g7k0nIJVVIvQzN/jT2x6J3N4Tbf20yJ1Av/s3o/CMBq9kLkVyCIbnNqrduHIJ
         1XyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKCb7XVkvsEz0+uIqPhZBsEQ9C6BtcitpwK6fVivjmfCxFEDdvwRlKxxeU7cRZ2NOiwVFsfCI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYay1QdozJVcS12gBLgQiyNUjf+2aAmiBAfMNNdQQbVXW/cXnq
	/TAdQJcGNLMHaTy+7SGiASb8UJw9TsCmPBcxqr8EiIvjW3ASzKv6
X-Gm-Gg: ASbGncvqPCgsChcIk6uzelpiY/hQeYRdxpqUHYJD/ICaTtqhumbxFXeSRbc8FXVzDMC
	gGmYHRXv8tWbuA2xCyu4nHS+xQP5c2a8odV6O4yxBU5rV1pVnaY7Qsf7bR5ntEQQXqQQlanthDb
	4d9wof0Gr1ew7TExpgn5MVEF3cy8HmNuHg9j0vAc2DynL/ELFDTdRPslxUJLPi/KgHAMsErszcL
	wW70foqW/FujQ0CLFsswlLu+nk8LFseN+WiqNe/1IhvBsNjU8WCU++jCaBP8Il+btgNeENhVjuL
	nUXjQKm01Y3wxuo6
X-Google-Smtp-Source: AGHT+IHSSsKyi9FGAPd9UU71QhjqJiaS5ihLbJsB2KEjxOY2dmC2E2E/lDqi0usoLmyGcynJlgTLAw==
X-Received: by 2002:a05:620a:460d:b0:7c5:4adb:781b with SMTP id af79cd13be357-7cad5b2392bmr136857685a.7.1746138234183;
        Thu, 01 May 2025 15:23:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad23c3ed3sm100036785a.44.2025.05.01.15.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 15:23:53 -0700 (PDT)
Date: Fri, 2 May 2025 06:23:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <ocbvvu7hmeh372dfvyokwy5saa3l3atjfxwd7i5prif57r3wan@mizv37xwg3k5>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
 <20250430-snort-raider-dbf10d14993f@spud>
 <otuaro3xh2ut3kurcomrq5j3guyyj7uhhwgngqdqqrrcpvlk6t@4wqbxy3m3tq7>
 <20250501-shrubs-unmixable-a2a8a9bedd01@spud>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-shrubs-unmixable-a2a8a9bedd01@spud>

On Thu, May 01, 2025 at 03:22:17PM +0100, Conor Dooley wrote:
> On Thu, May 01, 2025 at 06:43:07AM +0800, Inochi Amaoto wrote:
> > On Wed, Apr 30, 2025 at 04:37:01PM +0100, Conor Dooley wrote:
> > > On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> > > > On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > > > > Add of device id definition for newly added precise compatible.
> > > > > 
> > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > ---
> > > > >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > > > > index e0c4dc347579..e10221df6385 100644
> > > > > --- a/drivers/clk/sophgo/clk-cv1800.c
> > > > > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > > > > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> > > > >  
> > > > >  static const struct of_device_id cv1800_clk_ids[] = {
> > > > >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > > > > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> > > > 
> > > > Given the same data is used here, should there not be fallbacks in the
> > > > dt for some of these? For example, 1812 to 1800? Or is that not okay,
> > > > because 1800 is not a real device id?
> > > > 
> > > > >  	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
> > > > > +	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
> > > > >  	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
> > > > > +	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
> > > 
> > > Actually, this one is a better example. sg2000 is not marked deprecated.
> > > sg2002 uses the same match data. Why is no fallback to sg2000 used for
> > > the sg2002 case?
> > 
> > Yeah, It is a good idea. I will take it, thanks,
> 
> Can you point out the difference in the dt-binding patch when you do,
> between the sg2000 being a real device and the others not?

I will, thanks for the reminder.

Regards,
Inochi
