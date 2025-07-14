Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70523AD
	for <sophgo@lists.linux.dev>; Mon, 14 Jul 2025 00:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454090; cv=none; b=SNfCcRu1X/afeCDRa/paQViGiPt/UU0H5Aneo+SE6Hl9bYnsZU1yEQHZmZdezKYgRtpXnnwcYxGNQvb1LVc0WgTfUXqnGICLCPCqjatYt07NlNeXOVbdlOKuRUtqr9y220ZN9jNpWTFkVbkkSCT/xctPzPhS3LClZiQ6JvycX5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454090; c=relaxed/simple;
	bh=C1sFYjheOWlsTkZ2WNKpGWul8UIIVwmJu5J4YpJdNgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OELxFXIpLQz8LVjR/mWI69BeKxNBgHhO1LnTjtdhWB7swHN0L1jZNkvzOySq7A+bv9YVfkAbWBpdzyxv7jvHDF9REwSjAJK7RVHdHx2jqqwHp9LDTdytVeQWPJDdfOpldDsUtGUAQ+MDZdPtB1BzRgg+XNYxFCXN0eKRQkwjAfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqddsE7c; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqddsE7c"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23636167b30so32992855ad.1
        for <sophgo@lists.linux.dev>; Sun, 13 Jul 2025 17:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752454088; x=1753058888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE8gcfRQh+HMf4a6A0pf2sS0KbyGC33gzglhO7WkKO8=;
        b=iqddsE7cQMSH/mSN6aKyX/pBB4c9z1tVUhUz+hU86X58jmXA0G5ABBRK8q0zdclYmV
         j/CAv8gzbWkr6AevgTekmXcCIW/aLiyIuX2sFhZtt6sHRJGOUkOhrDls9nQIFtFG+sd1
         FA3XHuradf6foYaRFFVjG3SkJ/MNp4nJGzz2Z20PAKrD/R5CeQj8B1O2Mc1wyvWztL7G
         Nc9i1TPCH8a+hujG1zsmTP8V/cE0e27NBLc854IhliBS0a8LYdeHdHdqr+RNQbqKjgZT
         Q5S/93E6dpRWwA9NsBtEWZtVlMZ4pdpAfb1iJN493Fqlzkpa82Mjyi600qKlYJdPMSRE
         Dc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454088; x=1753058888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AE8gcfRQh+HMf4a6A0pf2sS0KbyGC33gzglhO7WkKO8=;
        b=MrrwbLmZryEw6Jc+tNu/zpnhyg8jgcNkzmc9Lf6wSG4rgkI5hnnGyv6qxxki7vJImo
         68QJpEFj+mwZViR0WorZyZEtHKar4xhOh0vP4j9jmvEK+3hHAV2WuS+p1in4S7BlR642
         5QUsqxlPuZXPgqy6Wno+P7s8UVd0KAFWjIiYchgR/+xvb1uRR+o5hjQsy0jkGviBBuy8
         ql7cItUYIh86TqxKnMXW76IbYwMiYOJ1x4lUnxT2Ub2Shhd5dyp+CTIF2+B2hm7cgIg7
         kyjUeIpXQV1R2XjbniV/f7kFiru/Bbv0rH/dPBkk4p5NatKumGAQs59S6LVTZUs1hi/H
         H5ew==
X-Forwarded-Encrypted: i=1; AJvYcCWQyGdDyDx6XDA9FAJ+zrbOvS+01n09sB0R6g+Bab09zUY3t/7I81uZe/8FEutVbfqoVzKhTAk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgMNaH0vGgBLtX070pJm7yVFHSmjDUZ3cd0vwbEEOhewjhXSf7
	5yVHZedz7KfS3j0I3kwKJ5u3BOw/TKLx4aVMIaqCRbuS1fIkFIwt8QBY
X-Gm-Gg: ASbGncu/Zsw4Zrpr0PkWEVInC8rgbxsX24a17iA54PuTaVaSbjnbReKSVap0fb/LUGs
	Ri1GukLfp1jUeQZxzSL5oS4ggOpqcR+7S3RL5gimOaVQt0RlW6oBAZb0fgG31vQQVAoMPhVE4NN
	Iiks2/EkRIvuoW1PPwig+FYPml+Fkqb4XGoX2lxSqxLi8mBKEnG6gINyF4eYRRkpQTe3+pxVzIZ
	CuVDutfKV0Lql7io5YK3+Jqq5XWgZcz4zULOaF+81QfinJou2mzVrn9MYKc41H/1byRf6iHRIKv
	j7P1nCDozBkh8A29uq+zRuLqSymjoHGbvx7/XE3yUhhkuekCQX7zxHx8afhCetvDWH6EPxXbF4l
	O1atfxpjwdgFFG7RJpudaIA==
X-Google-Smtp-Source: AGHT+IGfTuXiEaw1ivPyHcSOEg1RjHIi71oU6RD2M1GmI7E+NQWCV8xxX3I9b/f/wLUPbWMfwnb8OA==
X-Received: by 2002:a17:903:13ce:b0:235:81c7:3c45 with SMTP id d9443c01a7336-23dee0de80cmr163437605ad.46.1752454088461;
        Sun, 13 Jul 2025 17:48:08 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de4283a81sm81070505ad.27.2025.07.13.17.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:48:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
Date: Mon, 14 Jul 2025 08:47:49 +0800
Message-ID: <175245405815.143339.9845329520923216196.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703004024.85221-1-inochiama@gmail.com>
References: <20250703004024.85221-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 03 Jul 2025 08:40:23 +0800, Inochi Amaoto wrote:
> As the uart0 is already occupied by the firmware, reserve it
> to avoid this port is used by mistake.
> 
> 

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
      https://github.com/sophgo/linux/commit/a3ec6cda33ea16e3b7cfee80a6278085948cb793

Thanks,
Inochi

