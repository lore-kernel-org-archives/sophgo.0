Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CEC5383
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 03:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745985440; cv=none; b=hliHvPuLwVG3MjcY4ach0AynL++7wRBk3H3ZVkfilk/Mxhv1Dx/8Ur6SDxB49yskYbRQwuzmcMukmo8KB98Np8Iad4CqdWnx+fgBy4fCGAWNNdm6prZLUl2pndUATRHT31MF9xv4vzw9kwZIQeKi4JzYdAAB6/o1gp718vWBGrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745985440; c=relaxed/simple;
	bh=Nvuefhy7SkxmyXEjkN5uyEWBh1+CMbm33k3AWIeHcLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJuqnXecclNv5ylkR7SlhOVnctGSDlG+6XuPGDIORLb97WdNPdPw0ZgaKQQXln/90Z+IZmB9oCAlN0MaQ/xp9PYwVRK2q9EaCQcjJuJGLdQTOt0kgA7cH8PqJSj450mOsVBczwq3r/RZPh9jKbx1gZ8fIm6aDWUIYgngOqDkUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMs/aNQv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMs/aNQv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2254e0b4b79so101509355ad.2
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 20:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745985438; x=1746590238; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyLc3Zik1vXa0yun6h3Hm25QI+ZOjteMPcqNd+zv4kw=;
        b=AMs/aNQv6aSCpJls85PPvtcIBOFRzcyx1uxK31m7w0LT1YZ/AH1iH5Ros9gwxgEi3t
         oxMufNEIRbESiPWbRR6Qadnait6Kpi10XMaFPv4vifWGGMeI3TWat/zU9lou0CnFk42R
         Vxm6b0CcQvWw5+HMR2J428kz1YtGaSOhrUTj+thPIUWt79NFEVHhuVFiCTYiG1CX5/si
         M1wDR+M+BF4XLEZBwvFIviCGeQmQJJCxRhDspjG3wFnzVyUSY8Y+ck4dbv/RJZD5vAle
         je65U+/JcxQX7dc0qijrQJESXgCXsoYLkJ0LLwYQzujbULpiIui9GlvPB547IKrJlKRs
         DZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745985438; x=1746590238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyLc3Zik1vXa0yun6h3Hm25QI+ZOjteMPcqNd+zv4kw=;
        b=vZsunV0q3WGbMOOe72iPZxUydJ0gE/BERdCJhu2yOVdXbrJasWJJa+OSR9J2KoA2Nj
         7JS5KCmZqnkapWLQX+0QVwYcO1DpmAjOrxs0g7dZCIEYiYNSTwmpRnDWEUOKX2YfmPyS
         1B0Kw4V6uXKIaXycxpF3Bm43ge65vqP4gxpr29LyxuoscWt2X55zcKxEa2181aJ5uVvg
         25DneZ51zZ007jwRFsXOumn+oEl1cth4zQdwJfRIM9heF1Cx7Fta6rpKpd+kXP7I+6mF
         qZxdeybp91GLTIZy6MufMjak+UU6vHwWS0efmN/N7RSR03zm+iVBKCow59DV4nk926Cc
         92TA==
X-Forwarded-Encrypted: i=1; AJvYcCWC+KLEGAAFOpw92dgj5ac3mOvqbScq2WHrkL7xfpgl1JWsm/Ylum3nhpQAXPqzKz961irjjmc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9p1eLFUlLs/OYGmgdfxnhQwkYJgkWs41PMdfh+sobVwe4rlix
	YwppDuHYoFE9Tba8RZOWsoaB8CN23KrkVfreUA0+nHiYyfwvITyS
X-Gm-Gg: ASbGnctSBawU9itQBNM5CQeLLYJ8y9hsV2fU/uRCrByhQblnbtMpP2ZpSL1EIJlk4ez
	Bgto6COPsxoxRVQVTB9LOxwMFiogh5kTSOp05HLufPzagrDB4Dy2jN4Q94VNoKwcopVO/eiK2TX
	q+Qjjwa6r8lhvp1T6ZZV49GDK363CWVRKd/4bpzrF7rUPtBudtvod5OxfRuMpBTEeG2u6fxB8hm
	h+41NsuQx2L3TuG9gA1WpQWCfwc92OfFYPGbsNHMuzzwcHdd+qGcLibDfw7ZPp1m+3LAUlhURUy
	IjiOPDdAgEPxOg5forMfzXbgMWJkiO6nwPB+I6PQNKj3YlSd/5qtMw==
X-Google-Smtp-Source: AGHT+IEaMGTDmHzgNvzoHNMd9tZbR/u1Q5bg83MPGafcuW9LIhwRqcxCq0Nvid7OBBWwbxOwjAE/Fw==
X-Received: by 2002:a17:903:364d:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-22df3576fbbmr27513405ad.37.1745985437588;
        Tue, 29 Apr 2025 20:57:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100ab2sm111814375ad.183.2025.04.29.20.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:57:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 29 Apr 2025 20:57:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <08bbfb1a-57cf-4133-bd03-147ce107aeb9@roeck-us.net>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-7-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-7-inochiama@gmail.com>

On Mon, Apr 14, 2025 at 06:35:00AM +0800, Inochi Amaoto wrote:
> The MCU device on SG2044 exposes the same interface as SG2042, which is
> already supported by the kernel.
> 
> Add compatible string for monitor device of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter
