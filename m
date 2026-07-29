Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C38631E831
	for <sophgo@lists.linux.dev>; Wed, 29 Jul 2026 01:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785290119; cv=none; b=Qb5w7xfLl9xFPTbDk4kf3I0wwgplKQQCeO77PQax3d8AMbxJcgYXEh/zbwmxUEs8j3mjbQw3uZrVFuVftCjyUsYPkVH93pstjscgJzL1zq0RZXQcSIUitPOZADwLmw+5zqb0azpRk/FS2PUs+9jv+yNbmdLf6wDW1HRoMYP/5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785290119; c=relaxed/simple;
	bh=fOpsVuVC3B/RdkzmJZtkavYaZi3zOuhelSiQeYFmZ7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shgX1rLWkhN/QrH+1pWz+m6XgLRc7T4rzpZpXnT6zwuKxDhcfI1sEfcp03b5AcKAzAyMhbHPxBZMVQtp1zvA093YD5OgNcIVYctU0Ooh8ZK6Z7pzMRs2zD+Wa1jgPa7ecBruwu1P9Gop3aHvcgkd4OGuivuclknufLQtdhoEMkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+nJn3qD; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+nJn3qD"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso216222a12.1
        for <sophgo@lists.linux.dev>; Tue, 28 Jul 2026 18:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785290118; x=1785894918; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OrC+WlvYaMqsFVuQdS37eVhGU/gaCtUqZoAhWL5YwZI=;
        b=K+nJn3qDXN3/eFWbAVGUH+JGj+bPmDIEa6cw4gOd2hUb2AaxcGXO/WJVaYFLPgYed4
         GDCM4+08pi5fovyYU2Ei0AIyN6scd27U5eR2BYb4jlpivTib2frR0Pd7NVevhJrodesQ
         qQX3+3zGHJiPwjUfSjLHj686+E8081MN8o7sDAiiUfLqKFGyewK7FKRWGY0vSFyznz3r
         oaJ7AaHAIlTYwEIS8nur4GEXpd1JTv0OEcfJeKIQZaeXJvdWUKP4RWG6y8IIhrKp3mO3
         8pNUSO7hLNUoUA9Bi2y63rVHanj5WSQ/4CwtlYzGLAGXXNoITMCFk0EXJLXDQQ9aVXKq
         XxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785290118; x=1785894918;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrC+WlvYaMqsFVuQdS37eVhGU/gaCtUqZoAhWL5YwZI=;
        b=gVxCQcdom+RdfVWj7WTvYZxPi9KFp1D+bu65gQQdz8hAPK+lUY6Mmo5QHPcJoaelVF
         lupZkAklYTwUMZhfUVXkL8Vtu49huzr1EAZ5bbDc4ZrKUf4k7WQuwwZJ1ZDo1LUHO1pg
         W8420H2BDr/fkFPAP9lpQ5e8AYDNpmUNgaUKHJG0UykbuZ5ibgyfjc0Cm9VwPAyiZDt6
         itWp6sql5DSwcXhzE8/W2djqKz9UkAFJbtwy9ziCxV6so6bmxGTeMtPE8GSAb1F5CgCh
         WYKtD3ztsHbbxK4uVuIVanuEmCepBnsABXqOGtG9klN58cav+fLapRqyqlmg12OvAuLw
         UnJg==
X-Forwarded-Encrypted: i=1; AHgh+Rqtneh2rF9FDCaT3H9CD1CpoSVXyXEvwmfIuAEnrfOly+SmOryGgytEMMbesxnKQTebOdS9rh4=@lists.linux.dev
X-Gm-Message-State: AOJu0YywlUa3JDqJ8YeVDUtRM3McaJzxxWpF7G6/lNzhA3sotpro2pf1
	dDahCOwHXxdqXFpEa3S25a0DXLEQnNDT/NHiKatCXa9g4S9MqbeOQzjjDYNWn4wG
X-Gm-Gg: AR+sD11qiNvovhVuLODVvY/J798T0TBIIdNgZPOyr2v30jvHek/DV4Z3Gprk8SkKiKJ
	vK8IsV1wveT/Sxys+wObC8TVHWJIrRB02zHJdltjjyJTWAXtVasPs/DINF4X9px0BlRiyRxxJer
	SiIJGKGqbCRJ/ZfSRRr4/Kirutgj28QivUT7Th04/d0KyM6QjGVGyDi04ZCbqPXUAN/MEug7i6b
	yirY9oWxAWH9Rs+87slYXF0PJOA/yanJO3+5+/1KFxRLde6Bvll/eseRHMgDtElpqW1TK9Mx97a
	Yy0E2RFqHirdyce4P+vM2hDEMzLRHdsQ2nzGZKo6n369HcRAN2bruNLeZaZrWONCHGlJQtrSt5M
	M20IFw4lU/xs/YouZchBzIA2gESS19HWwujVC0UqL7dUZniSE9bzFtAPPihBT0gjWcOOsezpJZ4
	oFZrwLjFlE1nc0UZIxTvarLlokQBpYZBh3R8l1THhzKUTUOgRzsTISbasVkXk=
X-Received: by 2002:a05:6a00:35c7:b0:848:700d:c950 with SMTP id d2e1a72fcca58-84e93330d09mr4806240b3a.37.1785290117708;
        Tue, 28 Jul 2026 18:55:17 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa4d4sm590717b3a.38.2026.07.28.18.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:55:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v5 0/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 29 Jul 2026 09:54:57 +0800
Message-ID: <178529008851.164571.15038866333557612176.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 26 Jul 2026 01:53:42 +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M is a small form factor development board based on
> the Sophgo SG2002 SoC.
> 
> This series adds the board binding, the PWR_GPIO controller node for
> the CV180x/CV181x family, and the board device tree with support for
> the UART console, SD/MMC, USB host and the onboard blue status LED.
> 
> [...]

Applied to dt/riscv, thanks!

[1/3] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
      https://github.com/sophgo/linux/commit/623a0b16bc3a822742c2793266128f59ba4f847c
[2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
      https://github.com/sophgo/linux/commit/a625117e6c58cd77e88295e5470a3cc9578e4ad4
[3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
      https://github.com/sophgo/linux/commit/11881041b745b444e4f6c87a2748f1951cf02742

Thanks,
Inochi

