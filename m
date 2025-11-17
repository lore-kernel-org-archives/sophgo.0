Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B89316182
	for <sophgo@lists.linux.dev>; Mon, 17 Nov 2025 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366074; cv=none; b=th827KccwPQUw9LJr1Rt33vQhQjUvSemYu161hVKjNKQARRVoNXAiI5oJyDQAYLfYDuFKG9cg9EXd56DDzBM7BblPqExJjWh47CgRJRuA72kh9+xABrha71RA6voMnX5zhmN4cfJ1QP0m28aJe1sXVrnySdRFQZwfC9H51b0MFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366074; c=relaxed/simple;
	bh=YGc8Ft9DASPI0bBxZnU24htuMBkWHAOG+ihNABWr+Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A8vcF7SCbivZ0w5J0dXZ6P64sUx1Uq+8tWPVqd1YpemZ0IoZ+1nRRZ6lOWHvACJ/knc02vH7sIs2IXRlrYjgHjGj1u/8Z2ORM/qjq9DLCXVjAIoUW1JAcSUyH9QUKvhdxEsSyhmqCPrewl/qSXUz9clWQEijMMjf6xhbJEqN2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBfKiDZ5; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBfKiDZ5"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bbf2c3eccc9so3482955a12.0
        for <sophgo@lists.linux.dev>; Sun, 16 Nov 2025 23:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763366071; x=1763970871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJFYXjrZqLDFgZC57MuR9/7D9zTgqgt6RRzSRexdHss=;
        b=cBfKiDZ507qTslPzQEdfGo26pOhr/dzyZSyTO6De1UICJZodnMss2mx1lYIbWhrTf4
         spO4V0ZxVFiYD/YKZplrKAnYE9xslWg09+Rj/7eeudnlyS0OwmtSU8wavuvgdCnwfvsd
         KPhjbIiJvroA1GxnfGZpJSwPdxkbocrF/7Dz0GiUAaDKhdj7hpt9rqNFGiVuN6PZrn25
         n0Ak+sWGg8NKffK0B17AxLI8ZBH2oR1ebH7F429HS4IBg5950U9n7VHsSLfUMu6wOE4v
         6JQJl2eFn696K7oZInf6M8TkUg4h/VteRHCB0YG85JNwowJIc4Br675NCZ7tTOAsKzIB
         PwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763366071; x=1763970871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJFYXjrZqLDFgZC57MuR9/7D9zTgqgt6RRzSRexdHss=;
        b=T6StWZXzVgs7eg0wQKpiz/uiWUBevoQCTLHVRaBA/EHuYPJb8scsTc7ia6mjT4DtYa
         k/NgJjLJV58qWwuOtYSfQhm1CJLUtJ1AD5w1ayDPSnosIYVemWd7pqKmADLE5jDF6Y60
         W8mU5JHC1olX+R9vnM8fRcuSzTIJ9WomE9IEy+AkWDQz8sB7c6y9Eadpt/Mai0lOCRp1
         aaIToeBGj9W45QQTU1XgLOTvUyIP/d2YsdJPTjxfZ+SmbqrvqhN6DigP1tEtJKWMQipL
         je44S9LQIPoVSvjjCadE5e1H0+RzUtQ10ZhmanQ5MTC1Q3odtyJRIFZgpeUBKjU40hIY
         9Seg==
X-Forwarded-Encrypted: i=1; AJvYcCUs0MM6odx+4uC/vb7LYAC4np8G8HQZ9nTpjc8dWqMokNiaWsqFz2e5lGTuhsjDk1yv0rsg8Xk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0Sl14g70TYxk3Mu/OAv6n/Yv8IZOfGNN4HcUaYGSza7qQbFtv
	NiJA8uUKcbNbkfT2/Ul5EKicVvxJ4lSDq1JKlxdRCAYL0Iyr/OeS5WTtpZEJEA==
X-Gm-Gg: ASbGncv17Aw0bcCLXY0KwiaTWphvni08Rr+7qHzCGdKDyxFblpKyzLkKP7i1mlBsusf
	2pSm61aiTm34Pg+6v379AoLSOxUtjup4n/EWPC9uh4IT1LF/bT3uCUYKdGNvaGM379zCts29nnB
	MLl5rx5cQ1XRK5eTMXZjsCBAz5X2/ASChj77L1osIj4YEZqNtJv9T5KlhS021OnrhSwhsVCLTHn
	8XYwsQOYwYyGjVhY2P6NbKgiJSglysCAwJf04AtO/Aef57pPF7S4zBcqB4buGXTZd160V020sDS
	EPYh1V/0B+k48K2yJfOKT3dNg5l9z0sBVXRnO5x+xQ5dSY0tc+rvIJGo7e1bIcYeGdTnZThXVg4
	lDvtcWPRndGvPIIPKTnnu2xzcZnSldfuowKgnpBNeC5n5cs0+00EHOvIqNParaKba+iQe94yruF
	M=
X-Google-Smtp-Source: AGHT+IG9sGqvuDwl6M8wyl+rjAQw7Vc6OPhJaA3ppAqLpuVnEaDJYf6M8j/2uygP8YUk8imuBKovyw==
X-Received: by 2002:a05:693c:60c6:b0:2a4:86e5:6b2a with SMTP id 5a478bee46e88-2a49af801a3mr4018516eec.14.1763366071370;
        Sun, 16 Nov 2025 23:54:31 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm57344385eec.1.2025.11.16.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 23:54:30 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Longbin Li <looong.bin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 0/3] riscv: sophgo: add top syscon device for cv18xx
Date: Mon, 17 Nov 2025 15:53:57 +0800
Message-ID: <176336602776.743994.11109487529493161809.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101014329.18439-1-looong.bin@gmail.com>
References: <20251101014329.18439-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 01 Nov 2025 09:43:20 +0800, Longbin Li wrote:
> Add top syscon device bindings related DTS change for CV1800.
> 

Applied to dt/riscv, thanks!

[1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
      https://github.com/sophgo/linux/commit/565c450124c105a0b4f4ff3265e19502d44bf23b
[2/3] riscv: dts: sophgo: Add syscon node for cv18xx
      https://github.com/sophgo/linux/commit/126a1b3c61cbec15ffaadf141adb9c4163da1757
[3/3] riscv: dts: sophgo: Add USB support for cv18xx
      https://github.com/sophgo/linux/commit/e307248a3c2df4432a7bbbde306ffcb33ec55898

Thanks,
Inochi

