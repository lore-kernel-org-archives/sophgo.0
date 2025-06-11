Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E0D23F412
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637207; cv=none; b=rBdO/3abwzFqV9eO3DcZ5V04j3zMXzS6ozd8GXmBLAiEzXgtLLx87Jcesj1dPZcb+rxpdBd1NJLFgtG2kYqgRj1bq9PmzSlwEh3HGm1c+m9DEYMy9MKemfpufUUbQvh+DgxEvYwMRmegtLCOT8iLwoVTt+nXqtHVtLuMd4ZIz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637207; c=relaxed/simple;
	bh=nJF7CuwWBB1gORKLW/+1mTNYW7d4oFxecsfF9IbnXEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ag3J5HFMmFYo8CcGWefCtlRaUkAfGkx4BdhRvGsisRvGChkCmi3cCyOZr2U1O+yURqvR1PceOoWeu3jmD9LSOaWVtNgEhmGNrkbbKGWi2zlXDEQJNLIdSSjV55ylkaCqQk7hGV0oush8yS0ewkqgcuqRSivf7LCUnP0J+dRvSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBckoo2S; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBckoo2S"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d21f21baf7so585389885a.0
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749637205; x=1750242005; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMngYw0p0kJljlRaE+vGqGJX3Zi/z2Oh3oWxYgFvc0E=;
        b=BBckoo2STEnbKM41+0J+e4Y6tQDzE16nhUwTJlWVd76dWy8xJxU9t14F8jh+U39koD
         9yVTJyHvAz0L9EWHNyAVyfqpLiPg2oLrgcfpw+qieROlyODFbjl8UbfyrYzxb+5PLWFD
         lQKZq4c+n+rSJ2KK009B6rZCK9ucPSppBztKkyM6EcB/d+uEgbXyYvN7Ztl9FQ6wuHDN
         xaqVGs60sPJptXp67hMtRmXrlcNYBJpK2QfL5glaCR5b0FDDsoXxcyiuBGJJm4FlnbAx
         OtGuwxmU/wOXQCDnHDAwsDEnHJtORK89hse2aPRepyqom5RKBqcOc1C731N+lZWmV0eg
         8ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749637205; x=1750242005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMngYw0p0kJljlRaE+vGqGJX3Zi/z2Oh3oWxYgFvc0E=;
        b=dZrzv3tVtrUTKHdRDaz5CQbsFTS2CtnmN/K81jTUgD7cOqw6bXYmr6Ru6DgH+Me3zv
         5hjdhNyjJ+MPEybRRfZXOsU1rgoHMxf2OEj1Cc5InSR0pF0wC1BRunSB+XKNXy7t73nv
         sw4Ece838UDxHBYp4Ky/rZUzEN77ojVguLGlavx+gFj+JNNhdK38C9TdA8+rLVzXFFrp
         oUCYL2RvhqgYL9PmMeV6YH/Oil2u4z4ffQ7UDXSIHoRIa6YvbakLlpQyMy3W01T+8EHA
         zMc2s4ybpO0aF7WnaZk5unOpjBHX0WraGEkuokAh2k/AsG2aO+h7YTu/+s4I5b4eEj4L
         5vfg==
X-Forwarded-Encrypted: i=1; AJvYcCXgbWi40NkonObe1yzpGxDRtgz2qIjnkaC5mJziDsKYQGCM8iucg65YrjuO3FjOlzgrKqmc9Kw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUQuznpIfi74lckFEaYK4rJhW6FNU6fkTtgHGAPtL+fA7OcIek
	htVkmBBzhBSWMZ7sZkoCgQ0E8UCnimCsRqSxQ+AuF4s65+2Uk77VANGv
X-Gm-Gg: ASbGncuMJph4I6FXclrWgacdifruC/H2ewCdg2kRiPuOvmOidrVP0+2bFZ/d9paDYoQ
	dvq0ExAqjqW1TxQ32S/jqeH2XSGaOSiD5m0ZGX1n7z5umd9n9zLwmZ4EicOOME2LlNpUeNykj71
	l4qwjLq4MDW31se67lofLm6pF8BuBln7JzEJfn6AVSWRt6F6duBn2kwKFArRaXKMx0Pd6eekW6V
	CG7fats75L3eoLhn5gIq5BZ7BAGHDsH4IjIOitAdEssHQR6GwA0/1Vbub/6vKFV3UAy1Ihbw30i
	Z0TMBUH/MDrIfvt0mYlzVmOgdIcG2foRZR4SiA==
X-Google-Smtp-Source: AGHT+IGwWvOgxGgwWmHI6DFqSfjr/uyZDHPorlij65HU+xBh5KwHFJsTWak5AN3OsIOGWsf82thA1Q==
X-Received: by 2002:a05:620a:2482:b0:7c5:49b7:237c with SMTP id af79cd13be357-7d3a88e40a4mr411224185a.27.1749637204812;
        Wed, 11 Jun 2025 03:20:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a536b57sm837492185a.44.2025.06.11.03.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:20:04 -0700 (PDT)
Date: Wed, 11 Jun 2025 18:18:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Richard Cochran <richardcochran@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <jhw5maxfyowusq4ik24zrvlpjpj6vk5wqpfj6rhgb6b3muftec@5pumwwambikx>
References: <20250611080709.1182183-1-inochiama@gmail.com>
 <PN0P287MB225839D83F1A65D65D3EA6B9FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0P287MB225839D83F1A65D65D3EA6B9FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>

On Wed, Jun 11, 2025 at 06:12:54PM +0800, Chen Wang wrote:
> Is it should be v2? I see an old one https://lore.kernel.org/linux-riscv/20241028011312.274938-1-inochiama@gmail.com/.
> 

I think it is OK to treat as v1, as this is originally designed to 
be submit with the mdio driver. I split it due to the dependency.

Regards,
Inochi
