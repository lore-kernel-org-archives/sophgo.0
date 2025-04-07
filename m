Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07D81A3147
	for <sophgo@lists.linux.dev>; Mon,  7 Apr 2025 23:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068743; cv=none; b=iDVnv9tqmb5q4J8GxJegQEvejdtpQkKmV5BOt5YmP/QPah/ekOx/kPAmdqL8rFN2uoPpmPAuyr+mMOMcPqlCZv/4+BmbbMxLcVeHUwjiQGudvWXIWxEwlRQdthmGveNDr3lTDVSh1/c8cuaHmOnu/hNV2eunwVj+j/blwu4BBrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068743; c=relaxed/simple;
	bh=y0VMyqj2jrwxkMMoBpqQeCXfy0c7ujpzElgdYnxnprE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8eRrmIxXZio4iXqN6178caapVIj4LzAvp+yc87k+aXOKfoajBuNzOiyfSqbbFLMGuY4igLTCogEkBfxjEEoxOmFsMAV+sP+zNHaQJ1JG02Hv+FdOAYsYSLCX2vd9K/Vzj+H3UtsyswiiqWT1/1cFEdnGGCdV9yMDP7LFqNNzNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I466VSPM; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I466VSPM"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c597760323so443969885a.3
        for <sophgo@lists.linux.dev>; Mon, 07 Apr 2025 16:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744068741; x=1744673541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJIvZC6BOhqiO/IQEbyhQ90MLD58EsSNP3rWCk4udso=;
        b=I466VSPMf9rjkZHWMMo0yN2wVm8tStOeh/xm4XWHk/UrJBlAU3W/sXrPpVjVnCMIBp
         chBsvPD4GlISWnlTBDMeA+TyJJXrBlfQSt3R6aNcgDAZlzVMITEM4VWVzG8NhfXsGQIv
         P4vyekckZekxcYVA7r/rFiJOb/887+8Apv9jCTR+dbwOGhn7Im8mwu5iZxKj2FP/ZSh5
         bAPkKlVu41QsZRe4CdWKqRhzYN0tx8ONn8j+eA3PwXK2FYpg8Y2G6Lx+yIiOROzxIinU
         CndbqWL13Yrt+wMa3MnmwONI6Y5u3YKrElR77UzyZgRx2gDrJABHOfGMDIDbYgGs01Ig
         iFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744068741; x=1744673541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJIvZC6BOhqiO/IQEbyhQ90MLD58EsSNP3rWCk4udso=;
        b=CMqn18pm0/FxF54xhORQKiZ2awKurgip5jeLoVgRQBcM4HHMkVfGH88kZHMTau0xia
         WOqp2P0KSNLgegeIkLctFqGAICbzh7mpxIN//o5W2Z/rrGsqFzyo/DA5Xznf9Oe6QMxC
         rD3ppD66vcgeJ6n+V+4qLD2QMfCNIFr6JL0ACowqC/ZiANEAceYjTPmuz/lm84ku6MMu
         hc5GGNBAWT+eFjqI+qVbKS496QQ0ZZRL33iUIk9daLbViuvOQZjiMXnj2ENAiRv0JTO+
         sFYbLNrYfwOKyTEfZ3wGAP3rZviwVbSBPKMZcGxZWkS2c4n+LawnCc+3jHle0liliLO8
         xGKA==
X-Forwarded-Encrypted: i=1; AJvYcCWrx11plWXvzUmIyKzgar+VbfDHzdwPNu/xjdwYDPa6DNVt1C/xsiZ/HAXNh5QeialBEf1tvNE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0rKAvaObmBA0lTRa6XeEIG9oe5wXehMD1R0d5hGfd+wC4dL8v
	pYFyF4zN3jJ6rO3KQ+lMbBEGJla4zZ2BN3KJRPUHF+tBSL5AViCk
X-Gm-Gg: ASbGncuyhWUis+VDFaJqQLyEGaOLozmgBTAjBlndKMGDCZkf36gRIw72DhF0pCD6sgI
	PMaUglQBRkz39Zm5/XzcS+8Zf+BWTaC1BtXMOyaRbUSiwWAoMby6zfwYvcvJ4FyZKmgdDi6meTA
	/5QxQL+1hQt7j7KKeOaNOca4Im2Fmtg9qxYZ859wg4U1hkb2vulLa6MxoGvH1YrsDkIEeL3l4ng
	E46U/qB/R2n5kdYQ5kQKMtEi8TADO2OdF4d/fbs07bC2x1AOiMb9XTKTMI7CvkbSgXInKLRH3bz
	ar0g0UVW1PsHyUldAUmy
X-Google-Smtp-Source: AGHT+IEKkMIItDnAtEbc/6DeDUtD3EXh0WmABN9nky7dyvGG/jJvA+lzzO9SpmOhIoNbdRJ6S7A1Kw==
X-Received: by 2002:a05:6214:762:b0:6e8:e828:820d with SMTP id 6a1803df08f44-6f0b74bfde0mr179951146d6.36.1744068740691;
        Mon, 07 Apr 2025 16:32:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00e821sm65227956d6.34.2025.04.07.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:32:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 07:31:44 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	ghost <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C
 controller
Message-ID: <eltevzydjle25nyte5xn5mwxssi26awl4l4sgrz3v7h7m7vgur@tajtirx3up3x>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-8-inochiama@gmail.com>
 <20250407140232.GA2165777-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407140232.GA2165777-robh@kernel.org>

On Mon, Apr 07, 2025 at 09:02:32AM -0500, Rob Herring wrote:
> On Mon, Apr 07, 2025 at 09:06:12AM +0800, Inochi Amaoto wrote:
> > Add compatible string for Sophgo SG2044 SoC I2C controller which can be
> > used specifically for the SG2044 SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > index bc5d0fb5abfe..677b39865af0 100644
> > --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> > @@ -38,6 +38,10 @@ properties:
> >            - const: snps,designware-i2c
> >        - description: Baikal-T1 SoC System I2C controller
> >          const: baikal,bt1-sys-i2c
> > +      - description: Sophgo SoCs I2C controller
> > +        items:
> > +          - const: sophgo,sg2044-i2c
> > +          - const: snps,designware-i2c
> 
> This is not a great pattern we've started. T-HEAD, Ocelot, and this 
> should all be combined into 1 enum. The description here is not that 
> useful.
> 

I agree and am fine to do this.

Regard,
Inochi
