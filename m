Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A36B198E60
	for <sophgo@lists.linux.dev>; Sat, 26 Apr 2025 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745666653; cv=none; b=nDd6jBoigS7IRCWMcK8bZUGdaJIm5cB7+e7fTUm8+H+4nTvztDULPnj17GG4+ZjwATA5oozBEl5q2O7eywaAQCVGS+f+8HgTGiD51Awk3QNMtTiaCFCwnOi7ramiXDzBD1MWuXjLUIlH+Y0JtzMqEbnbKnbCH1EGmyom1k0Q8/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745666653; c=relaxed/simple;
	bh=D56xyUsRNjS6kGwI5WFwC9fzpNAmFejvLD+smYXxh4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/tr/FYIgrnMOrzzHjfJ4dk3P0jcQlk4IshPV3cRK72ja4jOjrdx3AEHT1bTb5fozGjsgfgKZIuIeTilhTaxnjYSBWrgLF7N9bLetiifiA8gq+XQqRQNxzfFsWlQ/bDa5jTspbEoOUDsV5WDnFu4o9ixfD39kSECAIm0MVyQH80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXyxU6cy; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXyxU6cy"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c56a3def84so312214885a.0
        for <sophgo@lists.linux.dev>; Sat, 26 Apr 2025 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745666651; x=1746271451; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqnzJpyxKOv8D4bjtcYPnfE8mIr/LA4bSJZ1glU6cV8=;
        b=FXyxU6cyED6BgdJKij15dSq9fbhGKJpdjmciiNYbU8UD1g5LFRtB/TgIkBpFpiJoHj
         e3FxxSP3cRvoMxwQujPlFgZ2Ll+2P9ndRSLiNCKDwTab3kIaTGPcfR8ksQ238wI6IasC
         HKZbGz5AVjt7JjOAWSVGClaN7LG4l73gdaIQAuXGIqFEKT7ZB868/65yJrWwcpdtLzKl
         FaY/5FHuVOBDxoyVGQu0Hi61rkL5C2n/oxpPi9iOuLh4hv5KF7QeYf12yBO8L4XjpBli
         tt9eVDJWUOijLKQVjJTqcgkwBAzop5an5+eFku1QfN5HEa6ZWZhPTR7ED1zWat8HCLSt
         RvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745666651; x=1746271451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqnzJpyxKOv8D4bjtcYPnfE8mIr/LA4bSJZ1glU6cV8=;
        b=t2hqQ3rUnfAjgPKmvH5VUD/jkF0l8jBVmjyYmsn9NP0KRsKOluD8KysDRUxqSarUcH
         GnI29y/dN7S15mIRe8LDvSuW+AxKp60EMTh29sLd0m2O3T9q2RQ3UfTgSGZAOQqvIFSS
         oejFE4UFCJSseWu0VkZ73hqVDGwp16ZIeF7NpK7O1WGZPfss44YomfIcCoc1ygAUKueR
         dvMqtbVnnIIeDKU98BQhtfOEqImZdvSqb0f1z7ETWlkhAr5YIbEu5zpUJ2Oss9CqGoUf
         /BUJuILvgEWq4PQHprBo4vmgpvEAjV6/rLew+n5FBG3iCX//H5YQCBXCkJML+yCl1sho
         PR2A==
X-Forwarded-Encrypted: i=1; AJvYcCWLojc7zO9WQwB/6HmXQCj9cIpzRZuwf5zC2rir0Of9xtZFCggCGY29yxDP8OnJfULV/eokpzc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywlye+5bBg2HF0NVdU4sysqLUAJbHqjxyLdVwMRqpyrVJClGd1w
	8RE0NmUh2VS3764zOw7fXYyfu8eNGbKrvaWFQZV1YkL0E24lLp3l
X-Gm-Gg: ASbGnctl+mx1ohpnadZWGxN0TndxJks0lUh6V+gbcGYeNdqiHtzkaWzBJl3lQtJMbnH
	rrgQC5WAcrVaS+MkJWRBTs5YxrOL28rInI8Xw1EXO3AfnzYA3bFahpcPqNRXtN/9L1zzmAM6dNO
	qSGtQQuOiEYYPDoI8YbAyKAPaeBTaZw3RFZu96WO3p+Jpph6q485OEmWURU6OtHAwcZWj1YL8qX
	WpPBVaPTDiXijWVNZhMO9zoEs9MkFwQm2pn5+FmW7jTrDLueJnxk8iaa9icmGwnNEy8PhG1ThgH
	fphn4QABojMiXeHJ
X-Google-Smtp-Source: AGHT+IHTJyjJW4zRKKH13NlfTIwZIg4GsuvT7hEkrKwp+YV3SS8iaJApxOfdun7TkRMs5S8LELbrRQ==
X-Received: by 2002:a05:620a:460a:b0:7c5:562d:cd01 with SMTP id af79cd13be357-7c9606f9a48mr802679585a.16.1745666651286;
        Sat, 26 Apr 2025 04:24:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c958c91a10sm337284985a.22.2025.04.26.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:24:10 -0700 (PDT)
Date: Sat, 26 Apr 2025 19:23:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board
 support
Message-ID: <2feyvebloqdcxxzmywe6azmwnz7zqulh2lixhw53ciw2ldisch@n2q3duucrp2r>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <MA0P287MB22626253965E96829B7371A1FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB22626253965E96829B7371A1FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Sat, Apr 26, 2025 at 03:36:41PM +0800, Chen Wang wrote:
> Hi, Inochi,
> 
> Will you apply this patchset on sophgo/for-next? I see there are changes
> just about dts/bindings.
> 
> Chen
> 

I can only take 2, 3, 4, 9, 10 for now. The left I think they
should be take by the subsystem maintainers.

Regards,
Inochi
