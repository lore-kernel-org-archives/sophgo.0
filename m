Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43F227A130
	for <sophgo@lists.linux.dev>; Thu, 27 Nov 2025 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764226395; cv=none; b=A4cUosicsRCVe1f6UJe7+oWf0Z1xage3yj3NhYz3qtfya3k8cN+9yA6U1nN189jSig5+WRD9UIVG2dmivQjY6C7G1V+7otnjzc+kNZJ+fFgooqclqN18/SAyBeUCGRj9IYM+8vAtedS5H4D6D03RGPscXiCru06a+b9i4t1DZ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764226395; c=relaxed/simple;
	bh=Bn4vWyXCm+u3LbjVg0e53Zz42uN/Uk1FceeEYna6WlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EB1DmjC1cD5W5XQF3f3YVqoI0oZ24dfXC6uImozAQ8dgurgkCGIObUq1kQ4f0ul0viMx+1Sa0ueh/FhJdPxC7u5wB4VuSQ7pe6A0tHmRTe9T4+d6fTkrv5a4NzCAmKk5v3vbohttzYeruK3vKdDiORgEnsvujcRel5xtZ9K2/1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWCiPaBs; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWCiPaBs"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b9387df58cso871823b3a.3
        for <sophgo@lists.linux.dev>; Wed, 26 Nov 2025 22:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764226393; x=1764831193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIm0qhUSQJPA8+i7JRVoDjMxtkUuF0ITyjHKbEh3ZwI=;
        b=JWCiPaBsa+v4XhpCJ/dss7G+Kzg9D3NcaWcwsM5GfPWkx8SEhSax+EQLas8SnTJ5NE
         eD1qH3WIL2TW9PLYYU3CSSXPZK58Ohggi0FLqVLjOWO6V6rBqF1MQau5bDEKQvETZEbF
         gyfo+/dMU3V32Z5Zxj9KIeqIi1IvxMsBWkrD3DWePbkcI02klF+cpfFbRVRTQhe7EqyV
         Gcwa293Xm6DM0gFHZJnXjQXjh/4FGf/zoytd1XsMDLyodvSIFYpsC2FdBWxKk+W7IUxx
         Eh93VuA3LD1FYanhWxwG4BLn9rxMn+uueohKv7iufdgd2AnWGFFMCO9nTjPIEQhSviXz
         rsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226393; x=1764831193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIm0qhUSQJPA8+i7JRVoDjMxtkUuF0ITyjHKbEh3ZwI=;
        b=f0SCPdOt/XINhwn11QTvikiHjVvcdY+kH12afqwAC7cl3j9/G3OH5dKZlB2Xmlzp1h
         Gc/mMjHXqyArkLkIoIR0+3nR0lu42tR8sNeZ5HkrVYuieYD5w05KJ9d+OdAkeYVYXpg8
         E9bx40ouUSGgyhoZuJowbzKdvW8qS37Pm2ZyZq1eRVS4qFiHnD3OAV+9kxDcWcoHeRKq
         8PmkyUWG/UjNzUhTdI799otbHtyrcDFjfLR/gijvY1zEVeyWJi7P+n8VEtW2izh0isbj
         XK9UYu3jEbdwj3D93HTNTp2FKHsk/93uxnnELNfuPOZJwY7H6/eikJCXAttbHvTFgO8J
         i0Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUiwA31eeY4f7kIJQGkfTLRdU9QvDcW6PlzLTEiyhSocqvCOrB8OaMVx+e5uOs416/prvRLUcY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaWAXGw2LbCiGsWeFzWJD6ZIzA6FSxRb7jcu2eISAuhAKpeqnu
	hrDD3ikYw/VWRJGWPoKqD8CKdHU3H1a/SVc1onLwkPGcP1bMLrLlLV0Y
X-Gm-Gg: ASbGncsesBTStRXmnOmC6t4yfYojY8lvoVGNvDWHSfWl3ixw/5il+/zG0pG3oaUMtpy
	unMADHGXCctgev6jD8nfMai964wcOM4nBawydJbWVcKb5ls9Fh/RZMQBA3dcq1vSsz8FEag2Un9
	FZjMhO4SCFmcaTp+kbkXm1dFSE4oc1PsjPtHukNDHY/OHbd81nqpUp0N/jylPPjEAqSaGz3OEOy
	gSGtnTcnaEGN1CCzVwDxqDqTFAKZfVJ3WuSrs582150vIX6amhQuA1BN7FCpxni9weD2KG0f1V9
	ELGDqn4Yg5ULn3ae0GnmluAGOelgDze+0cFODgcn9EwDNFcjs0uxFdE5o9U/izQ981OhxtVfF3K
	dIVj57hu1B/8KsgYA6f0dHfy82G7RLf72L75XspE0w0CMakZ2tiGCcn7aBjxq+ylpEb+6qQwrZJ
	HspKc4rnHbBA==
X-Google-Smtp-Source: AGHT+IFxjfjFGi0PvEP/u61Bpv2hr8HsmsxEwlN0jZ/EvMgNsPa1VIJ0a+6QbWVLIFVefWx5VjPgfg==
X-Received: by 2002:a05:7022:a8e:b0:119:e56b:c75a with SMTP id a92af1059eb24-11cb6835484mr6656832c88.31.1764226392879;
        Wed, 26 Nov 2025 22:53:12 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm3208764c88.0.2025.11.26.22.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 22:53:12 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	huangze@whut.edu.cn,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	sophgo@lists.linux.dev,
	thomas.bonnefille@bootlin.com,
	unicorn_wang@outlook.com,
	yu.yuan@sjtu.edu.cn
Subject: Re: [PATCH] riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes
Date: Thu, 27 Nov 2025 14:52:29 +0800
Message-ID: <176422633734.834799.16302142544416130381.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126172115.1894190-2-stavinsky@gmail.com>
References: <20250611082452.1218817-4-inochiama@gmail.com> <20251126172115.1894190-2-stavinsky@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 26 Nov 2025 21:21:16 +0400, Anton D. Stavinskii wrote:
> I've tested the current dwc2 FIFO configuration and found that USB
> device mode breaks in ECM mode when transmitting frames larger than
> 128 bytes. For example, large ICMP packets or iperf3 traffic cause
> the USB link to hang and eventually disconnect without any messages in
> dmesg.
> 
> After switching to more conservative FIFO sizes, ECM becomes stable
> and no longer drops the connection. iperf3 now shows ~130 Mbit/s RX
> and ~100 Mbit/s TX on SG2002 (MilkV Duo 256M).
> 
> [...]

Applied to dt/riscv, thanks!

[1/1] riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes
      https://github.com/sophgo/linux/commit/1d3ed9920a193e5d99d651d6ec1dbbe215ca172f

Thanks,
Inochi

