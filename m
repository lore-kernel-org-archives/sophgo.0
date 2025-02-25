Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199651853
	for <sophgo@lists.linux.dev>; Tue, 25 Feb 2025 00:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740443951; cv=none; b=gVeK+Trx9Zkru1A6R3mf+NVC38hjGyFMUYZoo022B+yaERqikkWkI/Kb1um756qsCEBc0lG3AYNLenq5NbIENmfCLB7dAagHN9JqJU8NP6VVysG7U243n8uZIotay1oY/9pmUtG4LMd0BH7isvU5WLrrPhcf37sqBTarWpuFb9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740443951; c=relaxed/simple;
	bh=Bi4cE+bok5QeHCT5gaLJWHNcaZlnJozQJCrrPLsDB3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNDhJEF0VOnnAfQaqWjnEhuEtN/Un7pkcjXQjmnOwLhC5RE4km9FspK9JCX5ajuWeH9lgbu0OGxeGVXYaEgAdmh3GBOZ6jbnBmmqQijaZhP5DERly6fDrpDIA/RHqeTNBUBA8cBBKRBmsr9VGuPFpfmodVbQO7UQYcD1pT9NRbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVbOpTXi; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVbOpTXi"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4720fb0229fso48430181cf.0
        for <sophgo@lists.linux.dev>; Mon, 24 Feb 2025 16:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740443949; x=1741048749; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WZV4VbgAA8psv5vM2PGHPKcQafhnuCZSauoIR3CxAI8=;
        b=CVbOpTXixsOq3/C71namPeafYF55EA4QHyBB1c4oU1zWSP9YB9x/73rTcM9CMBMCZ/
         XAQY1hcLMeK1BWvBsf+CWdU3lpz7Z5//yNQYb4Q9yTXaT+UWaviz0bCmOYtmlaPb3Ox2
         y89Mpylz/KkbXLs8XQm1nNryKbHcw+PJs4WJQTfM3EAu0fMqFGZFJyVryykzq2s9vMT7
         baboSeEEFw5fTVU5/T8ou47vn1/trYBPQbUkn7b4JpcxZCchdvZ88rNnDhhk5xRy5+zI
         d6umvax+3yfTzLXGHE9fNNOliwfYcCYY/TtOTcAf0he+zCPsV9KD1VKYlM1Ii0BaOKqy
         zXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740443949; x=1741048749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZV4VbgAA8psv5vM2PGHPKcQafhnuCZSauoIR3CxAI8=;
        b=LPlBgAwd+JujcvQoYFy8j3e7QQBxNYeo9ZVTYOMNlXfsfFfHoPAEspZOZdcs/+TaTt
         5NLmcbrtSxQgdE1Hs6awoOCCFHADmi9Knq9nv7G7a2EEfm5dicch+I3OqTz+oajCHtBv
         slT0XonzCHHwsM7fFzh40KUinTUxY81edNRyMRnIBL6wYkPbTZ6u5PVgJBB1zMBTjgbC
         7q4Lgl0tHG12b+b/domMYrxwv/t7r8Oxs5k4/nojdtVvLq2IB4UTkrp6kv1598bVA7kD
         CA2rYs9EBWaidrb1m7/JkMD78Ve2lijhB6BvXZxQpQvPWO6wPMMYYgrfQRPISqU8FEqh
         FRyA==
X-Forwarded-Encrypted: i=1; AJvYcCUqOaLhNZxH3wFIScuwvvVX4CEisnHHqXeJaGBvFWZlLbJUCCz82P3oZsxDbzLBTzNWILuwm1M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMJvTpBonwKLOHSSYnxONfeLzJYc0uLXRP2kg7nUNOahEPGW+z
	tTyuPm5blnfedr5lrmYAvv7gjAk/GedLfyCyLmNNxWOeZLznLoF3
X-Gm-Gg: ASbGnctKWnkAS6hq5sYvnMreP2adZgaEPMn7hE3zkAx4giJuALPPCxEpjE7JM8r1r6P
	K/Y2+5aAC6f24g8JlWsPMNisPM1iOJmZu8QkxahX6AJ/wiXYRgucRQ+clK3NH6sRy8/WxvzMUB3
	P8gUiC1Wbkk/j8fe6GKTFYfomlGqKzWycPH+6ok9WzKBeCedEPRnKbaAaHKYAtkJhpyF4u3/3EP
	q2y0MJlNgjnFA1xYB2yBUW8KiKkQ28Tx707ZYo+ffyg1VjeSdU6Ufsu9e13wdTWcM+uQ1xz6tj8
	YQ==
X-Google-Smtp-Source: AGHT+IF9/STffMSBQKErcBedEUh6zKFT5Jka/X26MYZ0WE84p6+GsFHddD/jpgfjAq683bXrYLKlgA==
X-Received: by 2002:a05:6214:2467:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6e6b002ee97mr205009756d6.5.1740443948849;
        Mon, 24 Feb 2025 16:39:08 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c23c34f611sm40101285a.116.2025.02.24.16.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 16:39:08 -0800 (PST)
Date: Tue, 25 Feb 2025 08:38:49 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Longbin Li <looong.bin@gmail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: add Sophgo SPI NOR controller
 driver
Message-ID: <nni37727545uwmq5uizihptcyq435wopjurdjcqufsfvfq3lc3@aq4zpb2l3nw7>
References: <20250224101213.26003-1-looong.bin@gmail.com>
 <20250224101213.26003-4-looong.bin@gmail.com>
 <PN0PR01MB91662EB902D8B337A0526458FEC32@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN0PR01MB91662EB902D8B337A0526458FEC32@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>

On Tue, Feb 25, 2025 at 08:23:36AM +0800, Chen Wang wrote:
> 
> On 2025/2/24 18:12, Longbin Li wrote:
> > Add SPI NOR device node for Sophgo.
> > 
> > Signed-off-by: Longbin Li <looong.bin@gmail.com>
> > ---
> >   .../boot/dts/sophgo/sg2044-sophgo-sd3-10.dts  | 18 ++++++++++++++
> >   arch/riscv/boot/dts/sophgo/sg2044.dtsi        | 24 +++++++++++++++++++
> >   2 files changed, 42 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
> > index c50e61a50013..9c634920f37e 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
> > +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-sd3-10.dts
> > @@ -80,6 +80,24 @@ &sd {
> >   	status = "okay";
> >   };
> > 
> > +&spifmc0 {
> > +	status = "okay";
> > +
> > +	flash@0 {
> > +		compatible = "jedec,spi-nor";
> > +		reg = <0>;
> > +	};
> > +};
> > +
> > +&spifmc1 {
> > +	status = "okay";
> > +
> > +	flash@0 {
> > +		compatible = "jedec,spi-nor";
> > +		reg = <0>;
> > +	};
> > +};
> > +
> >   &uart1 {
> >   	status = "okay";
> >   };
> 
> What is your baseline? I can't see "sg2044-sophgo-sd3-10.dts " on the latest
> mainline yet.
> 

It seems like he forgot to remove this patch as the baseline is not
submitted.

> BTW,  the name "sg2044-sophgo-sd3-10" seems a bit redundant. Wouldn't
> "sg2044-sd3-10" be better?
> 

I do not think so. we want <soc-vendor-board> format. In this format.
sophgo is a must.

Regards,
Inochi
