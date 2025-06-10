Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8883913790B
	for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 01:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520464; cv=none; b=UXLzoIMV2OKdDky+p0IMvAmE5gQJqg+tVbl97GBXg9Qy7yaW/HLHO/2RKAraLiFDdtYJCbPe+wKrVw6zI9xUG12Oc9s8/LmxpKDdNwN62kQ4VkadtZULwmw5m/9OEN6NDbyy+brGFS1jiJsYHQXOvuxNPsDEDo1DskKjkClvf6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520464; c=relaxed/simple;
	bh=NB+87qNxRVZfDW7UBsllocQT/yoOGf/1PU7g7n1qjaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ifZnqECrO6fmZYDRs5Eq2mcVG1PLLq63+DrM1oa6xx4yuR0Vx74YhnewYipcrQ2BcPAEuMvxbf9XLCe9vGx9fH5N8FSMr81MQGAXwIK+4nPblXI3UZ2LixUCxC5pZ5aJWTldwYMLHljSayW5CEdMMrOIXoP/q2DJQbu9wL+Ei8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWPpWVPz; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWPpWVPz"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d2107eb668so774270485a.1
        for <sophgo@lists.linux.dev>; Mon, 09 Jun 2025 18:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749520461; x=1750125261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zysQkTOL7VgaSXw9pls6ruJyOkXSEGdyuCbnLSDDgu8=;
        b=KWPpWVPz069JWY7gIphCQnRwf8aelBLbhielyll3IvRxIDrR5wLfL6LY/MQZCsqy1D
         jsshx7SEJCTeNEIc+s5g35T0KxsAXej4sSsxsJ+QLS8k7tyNbyoLz5P+lKUy/DWLLxae
         BwgbpJyZY3cDoGp/NisZOE8YhDblZJEHxjRS1Sikf6PCud4SQq4uu3bqwK6QG1EP1hqv
         f3Mb01Q4c4TU9ZndisvKzM2BZnI5JbeysIU8AcIlee+R2zto8tIODi2Gsrfa8snCeMIv
         69kP/vOds4u50wikiXiT6l+xlGeE3pckJj0fYgYndJq/h/E/mk8hQnrDJ0q1MqBXGDnY
         yytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749520461; x=1750125261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zysQkTOL7VgaSXw9pls6ruJyOkXSEGdyuCbnLSDDgu8=;
        b=XpNMLDNA+loN0qzDXHmtdHNk3CIYoZ7uyIMQCvz4iyOH4jBR/ygVyVkl4LyYSeYdSz
         f84yGAm7HkA5WQThSi4sWwAVlVABnaYjZ+U4vVQOHFWgRNFY4ZZhZJhC3i3zd8GEAWXr
         Pz1PajkoM5gYG1l0MJrMxfKerEWV8gpawYvbjTwVFLid3905m065B7HL/mMjHMD1h3bX
         4ujcxJTr6w4qXK39xG37RCfhgW6CotaJ6TRtKVwqf1Rw/H+RvibDEN9HPiXrG8+M2kUl
         CJwgqsOFOGhDrifDasEemJ+hvNTbBi3WbJi1Oiqd7i+NFhvW/5I7a3XgUoKmZxIiJiHe
         TcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiDhp90qKy+gWz12kVjjcZUNwegHqy26zy5GcDZ6cMXwnVPq1ycqTvlzDUalKbMqhL04k5jAo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTSNrfKKzbnEi/iaM9QZiqPoNhq2f0LRNald9HacZ6J8O5i3al
	lu2VY2uXBK8jzM1qTrDyG+dudnq9rD3sKcZHvGB5MEO+ICeAA10QTwod
X-Gm-Gg: ASbGnct0FtG2qm7JR1jJsQB4c7wRjVznH9MIPtbmMjgjaRWZDzMc/RuO5VPeJrTb1Dq
	pUF1+wOGWdCbcrTmD3AvXCxHB/HVemvWaanEZVEsp8pfc0FpuCk4+kelAu5xPdQpFi4l3Z+xcJy
	ozB3t4CTia1LczPb/4JjrSoTenvFrorh23X8PRipnGV1Je8PUxHWdnGmjhGbysQzMCPFYEUXdIU
	x91COKN5r3hCFqPKQXEsRmQevJKEjNUcNDjAS0s4rsCSlodeiMn29muF6chS0+0HljVkGD6Oa2H
	Bklx8aiKlkHcyUwocmg6GB5y8AjW89fccvzH2/ijdPfYbEsi
X-Google-Smtp-Source: AGHT+IGJg+//Ofhuk923r0pXGjvlOiPdRgjYkQEFmw4lkzq3etJ3xBBBD+f4KoaeRoOYtCBqhB6xhA==
X-Received: by 2002:a05:620a:8b15:b0:7ca:f3c6:c0a1 with SMTP id af79cd13be357-7d2298ed317mr1921854085a.55.1749520461458;
        Mon, 09 Jun 2025 18:54:21 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a61a8ebsm622857485a.89.2025.06.09.18.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 18:54:21 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	sophgo@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Date: Tue, 10 Jun 2025 09:53:12 +0800
Message-ID: <174952038849.949885.15347540485983948845.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
References: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 13 May 2025 22:31:25 +0200, Alexander Sverdlin wrote:
> Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
> is quite advanced and provides SoC power management functions as well.
> 
> The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
> and an associated SRAM. The corresponding control registers are mapped into
> RTCSYS address space as well.
> 
> [...]

Applied to fixes, thanks!

[1/1] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
      (no commit info)

Thanks,
Inochi

