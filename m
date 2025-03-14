Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C32126BF9
	for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 23:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995892; cv=none; b=WZAquEhpvPi09XMcId52XzcHYOM/03k3A97nl5e0GD1B/LQXUXi1X9xv8EsudUaFnR5mbk8oW2VVnK9PKh+CGffKNIYYc3XBKAkEh8bcRlS1i73T+YWo1xsDzdLEJOgGX1jOzdjLdQbM+nUdgM9RRBmv7y0TnI0E1kGyAm5S2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995892; c=relaxed/simple;
	bh=wF+lsQ7mJEHmcAoxF0flsvm5gnamzI2adupFAmV8+HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iht0gFVkjJZkjdeO0qO4klvh32PhijcSHUoNyx8SYPsjQb8jzoLjqWS5ES1qJlDs9GVjYOKoHEtG/HKCXxgY55470EqB8BAWTyMp/GF7AlQ0FWGCQsmj2afBsUeJENktpOI6MZmhHn+YE1gu40tt/ji0QVh10JlQoxm+pMVspEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8QpVDQs; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8QpVDQs"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47662449055so13014481cf.1
        for <sophgo@lists.linux.dev>; Fri, 14 Mar 2025 16:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741995889; x=1742600689; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vjrDVi1XuD8YezTfvAJnDkQnfPVZJ0QiIFwJDMUcMU=;
        b=Z8QpVDQs5IEzUFce3cbfVYx+ba/mqiiI5Xi/GDxDrfcebJpjQ3iKBH4U5mIv5kXBh6
         QZXckgi8iHyIubBFrYjeR8V3/T+Pty7y05CnUNGc1Pom4MhY1rkXAGegouCffS8ceF0I
         ntS5hh+oYe9+FoyRuGDIoocOuOwNvKgYUbMx8bQfHIIVW9zkOU8X3ltyr5sO0A8ySqNN
         a0Wdj/A8O+YNeTzcpttckx0qC3cSS9722p1wsPlAuEGKkXhhZbjy9Y97tj/1oQzPbRo1
         PKXlCx3csHQDCgd5HWmx/1IV4r9LZNxMgmvnY7TaIPcD8da372S8qnjyL9Q6dAsf7UEE
         fv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995889; x=1742600689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vjrDVi1XuD8YezTfvAJnDkQnfPVZJ0QiIFwJDMUcMU=;
        b=Yx0q5uOF2DYBECcTtcpAGXVMkHdElwCDFHWwk5VzDeyrASIn1bki76y3O9uDyOCBMH
         sRA+0wsGEB2wkkEQOGC8KAtAVC4F/S94lmemb2fW5cP0OHJ8H+s7MSXVT/DMMhmLDW4A
         B6wK97O2YKXQmP6HNK6+N0q/bhc2gfJ5AOSFoGdIHR+8iBzU5aHN5Nv4sxPn68sa+of3
         yttBd5i2uUMcTj8ReF5H/Cx9rKVn/y+R1lt/bPvhZXd4dJJgp9ADu1zvXDhUhzan5hrP
         0HEcgLJBZjRQxR0dHxD0L4bl6ltpvlzYkmZVSpvwfBSbPXi/nkowVmTRH2dByEcblHl/
         uoZw==
X-Forwarded-Encrypted: i=1; AJvYcCWdu6DQLXPLpFAyreMt9uD7aIHrX3bTUSZOr7eB/qcsSvAvBuzw8lKD7+FvPSat8eJ8gc/atX8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhnPg3FYYuaW/GYoprDIaOfabiGplTncILVSbZTZQKXpUZ9Wrz
	U7k/VRPpzwNuNARXaroAGDowR4PGEwMa8oDk3a+8qL4onyPrdYd6
X-Gm-Gg: ASbGnctINNPM00BqiDs/hFE8pWoRDzszlr8vnAEdjdJqGI2pHLJHt3BLrwUaI+noUrO
	ZSd6X6PfWxi7AzdcGx9LaYFXjzKTFmuD4RlYZufpa0C9eXLOK44Yjt5N1GmoobW1DgwZPAMUBfs
	RNDDRjGlAZRlclzffinlaL1bVN2F66IRZxd+7ZshsiHoQOCXMgJsKJOKGbmG5uL1ilpVrGUOgrt
	80/Un+4HH4ql8RqGxrCCm5UUw+bRoIn98cvt+1ZtuPtQBkSlrPbhqtWf0302/U1X40i5rOh/G1B
	DwA5yZ6HIkv0et3ojHrW
X-Google-Smtp-Source: AGHT+IHRUH+t/ZNriz9AIIFDUvNwqNXSWGPqwO6hLy2CrfDloRoUEfYKSMvcUddQ0QqLGeQiqSDYOw==
X-Received: by 2002:ad4:5946:0:b0:6e8:fe60:fdeb with SMTP id 6a1803df08f44-6eaeaa08163mr56420036d6.17.1741995889275;
        Fri, 14 Mar 2025 16:44:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eade254502sm29566866d6.59.2025.03.14.16.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:44:48 -0700 (PDT)
Date: Sat, 15 Mar 2025 07:44:37 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org, Conor Dooley <conor@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Message-ID: <ilkznijefh5haqed3hpj5mynqiqoqvmzodes6os2cccy3tdxf7@zvv3o7k2eful>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
 <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
 <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
 <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>

On Sat, Mar 15, 2025 at 12:42:12AM +0100, Linus Walleij wrote:
> On Sat, Mar 15, 2025 at 12:20 AM Inochi Amaoto <inochiama@gmail.com> wrote:
> 
> > I guess this means we should checkout the binding patch in Linus's tree
> > and merge it without other driver patch? Or just take the binding patch
> > from the patch serie and let the git ignore the same thing?
> 
> Either way works, it will not have the same hash so it will appear twice
> in the history but it will be textually identical and git will sort it out.
> 

Cool, we will have a try, and send a new PR if everything is 
fine. Thanks.

Regards,
Inochi
