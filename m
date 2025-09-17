Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063EC1C5F23
	for <sophgo@lists.linux.dev>; Wed, 17 Sep 2025 06:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758091106; cv=none; b=kW/dUvKKK/g8xhKLHwXGJo2BXQSyeMEksD+o82Rnz8RcwktQealyd7SeDsU5CTP9Sly7eDdRWijc8cId9rxUDUzZKch8jt69sWTcGcxWc+zG3zdnrG3dUWhZ0eZsOmrdOmHeG2edvzPMxK0DpeAl13TZZH9GkR/7U/lrKKzYjP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758091106; c=relaxed/simple;
	bh=YYyAOVBQQtvxzPrtPJTgX3jJY+qiOrBT4+FZybWQNvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PoOr1AlLO1w0QK86J7woTHa5rdIcBvIQs8/LGrgIJ2Id35IACwkKYHEomq9Fyuh/m3E1lsEuqmEATx0ykrru/MNseyFh8IljtJWyzfjt6tQ189KZ19e2Tmy2QZRyhUdCVcA+/LnVrXCIDZnNBXhsoPwTYKl1dfqLzoiwRbNAZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYaYN8Vx; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYaYN8Vx"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77251d7cca6so5917969b3a.3
        for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758091104; x=1758695904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9a6eDfP+fBc1ozuBGmtJ5qlwX2HPSbOLB5AoahUZfu0=;
        b=bYaYN8VxJlVF8LAKNLcJWix5VGdJDou4+reLE9rfauzxz9Dzb5b7y9G+TEUzajgGtM
         S8ZoDxh8HPy1IRIw7/AxXjRKPP5W2STm1EW3TgV+LqeqgzZVQwOEeiX0SJDBWx0vie/I
         dCA4dy+7bOx9+ftjV3mhNAgAnijt4NXkLfe0LYmLJBy0hcBg4EzI9ajZgRCgqzgWKdhq
         MrfH1oKTXx5WuH6l4N22mDzeHPdYtmd+9mWSYuxy92J8xXDoXHTC6MWI85K15E1vx56A
         NHBLEDcYih/Em6IxmHW8uQfG7Rtom4WaWVKB7/6rrJMXd/w6SGBLgjS88rR1qSIxLx0N
         O+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758091104; x=1758695904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9a6eDfP+fBc1ozuBGmtJ5qlwX2HPSbOLB5AoahUZfu0=;
        b=NYgKEEhJ9kHKZxFzaP6WsnC8rpJ1wmeubE1rW46Rs2wgOEjHm0UVV7EMp6oCLL06Ql
         ZrMATxCYsbtVwV9Zjs7tl+85t+FmRel5sEAO5ShFBO83GzpsydgJKpUC+N82rIK77fFz
         rvMO6+Ppg3uXATfzAkWwa5SpBpKzwRB9ELpoTsVM6qo0nP5xddeMPiBnRd8lFs45tIAt
         FS2CNxLvUcHGOOLX9XFrecb4DQ9Mygt8+XjtTXljLjS9NoLWp39J39rcRieZRTi1se2I
         EXfc2qTFwTc1RPZzueTY7ueRa9lwi1inzGPP3VpLw8YuOy0edfHePlCzkrvuEGAPPl7B
         11qw==
X-Forwarded-Encrypted: i=1; AJvYcCUDJVYss6F5HZ9sT6f2mS157MbW0Z/t+DfqNtNhMuzJ2/vKe9zp/I3dJoIf4DG//ygbbemhf9k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNDa3cCBlCZIpFCVyhpwpujxGfXWJFtjylGd62eoLW5xKmR7gP
	77StTwSTfQbxqy1AWctSL3J8znCO6GXhi3B/iHco3JNrmcfXBmHSf9KT
X-Gm-Gg: ASbGncuZK3MC6qugCnpihHyQEduAjyUDjpsxOXNZXu8zFj8qgnmbm9Ot9qwtqNlzze3
	RZWiTRDLBL79Pv+WZ9K1PL7T2jKl8eEy4y57vpyZW0FDE2YsVpKWUTchzAPEXe8dUoUw2Vt4YZe
	ohai0cq35gNyZWv23UVnQgi+UDs8WCIcuF0R9J1lWdL2EjLpokSX2rMSEcvkunamCtEHC5i8Jpc
	Mtf3iApnjCL05PtCKrZ1mrfNIBUvsnK3g6eIB8TrVHebkeQZAloCOdNBlFdWHqMgKhhreSzxMRf
	fwXVptbd20+5f8rx3TjrJovWDuCGUgkWaj9VsfTZogB+/fdxhQzCX47B32BBOdbcHSh3ldYK1Sp
	nK/O/kPgqV2akwArJtVgo5Q==
X-Google-Smtp-Source: AGHT+IHq6XZ5/++BtlIMzWowm21SXwFZ/EFsiRjC685ax8WDJ8CH4yI13VvPILnIiTf325I/TiMPPA==
X-Received: by 2002:a05:6a21:6daa:b0:263:81aa:d60d with SMTP id adf61e73a8af0-27a911974e0mr1470121637.14.1758091104211;
        Tue, 16 Sep 2025 23:38:24 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-77607a47310sm17432570b3a.27.2025.09.16.23.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:38:23 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: sophgo: sg2042: added numa id description
Date: Wed, 17 Sep 2025 14:38:08 +0800
Message-ID: <175809106542.461740.14901329077964229669.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910105531.519897-1-rabenda.cn@gmail.com>
References: <20250910105531.519897-1-rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 10 Sep 2025 18:55:31 +0800, Han Gao wrote:
> According to the description of [1], sg2042 is divided into 4 numa.
> STREAM test performance will improve.
> 
> Before:
> Function    Best Rate MB/s  Avg time     Min time     Max time
> Copy:           10739.7     0.015687     0.014898     0.016385
> Scale:          10865.9     0.015628     0.014725     0.016757
> Add:            10622.3     0.023276     0.022594     0.023899
> Triad:          10583.4     0.023653     0.022677     0.024761
> 
> [...]

Applied to dt/riscv, thanks!

[1/1] dts: sophgo: sg2042: added numa id description
      https://github.com/sophgo/linux/commit/4d94abded400a5194b929c26b3aa07fb9485fe35

Thanks,
Inochi

