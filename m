Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE78F9E8
	for <sophgo@lists.linux.dev>; Mon, 26 May 2025 22:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748299436; cv=none; b=OMd8U8Rs35y5rrlhyijAzmdO3cXvakFyRvnPGYKHCg41c34rOH+E3rhXEv0kW2Lw992xjElLoOIQXV2vbGmIV7JWc6GxVya+AJGErzwdQJRQUuuO6FNGk02hFTkYLGINgXgcNpF68JTS3Bw2vHa2Il/os+CBSUeIhPnOSHlhvf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748299436; c=relaxed/simple;
	bh=Mi2Ff9KcvJlJ1I5165WQX0hXzW7MVIgLgJ+u7JSVo2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPwlg3DQqlh1OuRuJd2mZoO6e3DQnACA1yQ0R+NxyUi+TOzlG/LfuhladmEq0jUVEWYwmmJFu1o0mA+wd3hXNB9F9V20ml3B3sQjEoDCA5ozbQDSoY1websU6vGzWbV5MLFF02ZEjOc5sz7//k//q1TQd4ukfYPX/VFMH8pE12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFHbStLu; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFHbStLu"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6faa63da2bcso16842526d6.2
        for <sophgo@lists.linux.dev>; Mon, 26 May 2025 15:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748299433; x=1748904233; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wYcdN/ntCi0NW6y9Z+ruW/GeFwKcxSJjeh5zF0q4iZs=;
        b=GFHbStLuB6Yva/WKK5iWwohPXc22Ex4IpY0K8ufiqGg4g+d0dXvykuMAbEKUpAlKZh
         PZENRbLmIaEBx8t4Q4NT+Gxbw+Pscb6ZaN2RBmXf5V/+2j0lWaGvsoYXiKw8kSU/806u
         gif1ksmdH+FlqhBilpSLrMK2gcJp8jtZoY8tGVvBQjLL7d4tMeeStw4NldZnV3V7W1Ax
         jVR8ZWQLUuITr7wDxkYFVgdlBIdpMy05hIaAP7he2mY1/dKvjvgFUkK09ECEGlxRSbv7
         98ryYPWSqSZuwm4v3GZV8K3ijbMteEBXmbsbQDbho/mqW6wrz+t1+S9Ag/tWqq0uctE0
         Fv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748299433; x=1748904233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYcdN/ntCi0NW6y9Z+ruW/GeFwKcxSJjeh5zF0q4iZs=;
        b=r7GiMyq1yEolQ9wYMI3FrRlXMyewGzujehG4e4WEMhPJRmg9ux2mePL4eRuInVcVKC
         RborSTKS3z/HWABfDCvyFrb0PZkMEYKT2g8cD9meQlHPKyfFFLj9SpBmCaZ+unqN9h9w
         Q+fd/epPhJ42eCnZtyKpMN4GRpg18MANK/IfdoeDcFDRFZZnLfX9m9+JrSHmV/C6vMXw
         izqQZDTtYoVGqBPEK+5JKwrMi/FEdsPl3y3nRyyGYzj6SpTQgG+kgfUG1bV3gaNoAb9a
         LoztlMpLjJYS1jec1vv/5EcMFzhdaeyNontEHZkwGfvSPTBS5Jv4aknVynoPj7H156Af
         Nhtw==
X-Forwarded-Encrypted: i=1; AJvYcCXFifgyTLS+sMTJO2tENM6CW3xkn9SkjHGslNSMjFwXN0I6kLmDeNbC383/u9KrKUnUCP4EG0Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw215mjCBLEOUmRr61i++nIZgemt4JfZqbSMtlw11FZs2ygUYjH
	SLG24GIuTA41YSnOK8Elu02aViLcTOJdeki6+cBEyRkFKyAA2q1jZS5v
X-Gm-Gg: ASbGncsWiO/xYzd1wBxIXaUXMvCr8TF4v2u2EnXUdaxklQaM3z1m1AhgJBw8SA9bGBa
	DwbQJfGBWf73diIyQnXroSdbjnI8N0iDI07h0zPDFd9y7mphUXn2O3tREzVb4jltGh9bkNgc5cY
	l2kamUPMYY9+NgvEEaKPI74mAnmhuVHkEIfTE8u9QNXY7/jI4VHGmHyOSjSOhnSRF+h776NByFf
	fw7n9+YYsJ6/INy/A71sBMQ8aNJgOyK/EDEYyr2Pou+UqI5AxTa9/j2IEupMocnBeJaa1HwOQQD
	6O7uJp6gxH2zFZscx/m4STlrss3F+E13ha5XUQ==
X-Google-Smtp-Source: AGHT+IE6GrG91KwWKCqmvlXD/KUQzQglLbhJ+TsLp61QU4Z6DEm1+X0Gf8hRzNSZJMd0jsM2Dvj8rw==
X-Received: by 2002:a05:6214:f04:b0:6f8:aec7:1cda with SMTP id 6a1803df08f44-6fa9d00a343mr172227576d6.17.1748299433456;
        Mon, 26 May 2025 15:43:53 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6faa481854esm29328266d6.22.2025.05.26.15.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 15:43:53 -0700 (PDT)
Date: Tue, 27 May 2025 06:43:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jingbao Qiu <qiujingbao.dlmu@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Message-ID: <r65g6xww45zdnsuusobnzfg4pszjzkscg7t464e5eas2ycikzx@xed62astc3az>
References: <20250509-pwm_sophgo-v8-0-cfaebeb8ee17@bootlin.com>
 <sfqdke7xkxg3sr2acber6kjzbcnoay6bnu3enda2xe5wzdi6id@eqiqmkdeovlb>
 <uy4idpkmmyswci3o5dul3xwees7azrs2dhorjgb5lxipi4bllb@7lbldfrwdsj7>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <uy4idpkmmyswci3o5dul3xwees7azrs2dhorjgb5lxipi4bllb@7lbldfrwdsj7>

On Mon, May 26, 2025 at 06:31:42PM +0200, Uwe Kleine-König wrote:
> On Fri, May 09, 2025 at 08:14:57PM +0800, Inochi Amaoto wrote:
> > On Fri, May 09, 2025 at 11:45:42AM +0200, Thomas Bonnefille wrote:
> > > The Sophgo CV1800 chip provides a set of four independent
> > > PWM channel outputs.
> > > This series adds PWM controller support for Sophgo cv1800.
> > > 
> > > Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > > [Thomas since v8]
> > > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > > ---
> > 
> > As now we have pwm support for SG2042, I suggest sharing driver code and
> > binding file with SG2042.
> 
> How does the two relate? Is CV1800 the same as SG2042? I'd like to know
> before I spend time reviewing a driver that is better spent elsewhere.
> 

IIRC the pwm SG2044 is based on it on CV1800. And they both share some
common logic with SG2042, like setting PERIOD register. So I request a
merge for it.

Regards,
Inochi
